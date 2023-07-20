/* eslint-disable prettier/prettier */

import { Injectable } from '@nestjs/common';
import Web3 from 'web3';
@Injectable()
export class BlockchainService {
  private MyContractJson = require('C:/Users/yousf/Bureau/SummerCamp/blockchain/build/contracts/TransactionManagement.json');
  private readonly contractAddress = '0x29F138111b4984664B1771dC738fb0B1A6995e93'; // The deployed contract address
  private readonly contractAbi = this.MyContractJson.abi;
  private readonly web3: Web3;
  
  constructor() {
    this.web3 = new Web3();
  }

}

