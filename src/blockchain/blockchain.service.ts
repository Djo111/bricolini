/* eslint-disable prettier/prettier */

import { Injectable } from '@nestjs/common';
import {Transaction} from 'src/blockchain/interfaces/transaction.interface';
import Web3 from 'web3'; 
@Injectable()
export class BlockchainService {
  private MyContractJson = require('C:/Users/yousf/Bureau/SummerCamp/bricolini/blockchain/build/contracts/TransactionManagement.json');
  private contractAddress = '0x3A51644EF4c44644F6Ae39E66e165e1Ab6F7945e'; // The deployed contract address
  private contractAbi = this.MyContractJson.abi;
  private web3: Web3;
 private contractInstance; 

 constructor() {
  this.web3 = new Web3('http://localhost:7545');
  this.loadContract();
}

private async loadContract(): Promise<void> {
  this.contractInstance = new this.web3.eth.Contract(this.contractAbi, this.contractAddress);
}

async addTransaction(date: number, wasteType: string, quantity: number, price: number): Promise<void> {
  const accounts = await this.web3.eth.getAccounts();
  await this.contractInstance.methods.addTransaction(date, wasteType, quantity, price).send({
    from: accounts[0],
    gas: 200000,
  });

}

async getTransactions(): Promise<Transaction[]> {
  const accounts = await this.web3.eth.getAccounts();
     const transactions = await this.contractInstance.methods.getTransactions().call({
      from: accounts[0],
      gas: 200000,
    });

    // Parse the result and map it to the Transaction interface
    return transactions.map((transaction: any) => ({
      date: parseInt(transaction.date),
      wasteType: transaction.wasteType,
      quantity: parseInt(transaction.quantity),
      price: parseInt(transaction.price),
    }));    
}
}

