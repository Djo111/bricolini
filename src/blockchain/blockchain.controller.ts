/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Body } from '@nestjs/common';
import { BlockchainService } from './blockchain.service';

@Controller('blockchain')
export class BlockchainController {
  constructor(private readonly blockchainService: BlockchainService) {}

  @Post() // HTTP POST method to add a new transaction
  async addTransaction(
    @Body() transactionData: {
      date: number;
      wasteType: string;
      quantity: number;
      price: number;
    },
  ) {
    return this.blockchainService.addTransaction(
      transactionData.date,
      transactionData.wasteType,
      transactionData.quantity,
      transactionData.price,
    );
  }

  @Get() // HTTP GET method to get all transactions
  async getTransactions() {
    return this.blockchainService.getTransactions();
  }
}
