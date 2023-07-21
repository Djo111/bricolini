/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { TransporterService } from './transporter.service';
import { TransporterController } from './transporter.controller';
import { Mongoose } from 'mongoose';
import { MongooseModule } from '@nestjs/mongoose';
import { AuthModule } from 'src/auth/auth.module';
import { OfferModule } from 'src/offer/offer.module';


@Module({
  imports: [AuthModule, OfferModule],
  controllers: [TransporterController],
  providers: [TransporterService],
  exports:[TransporterService]
})
export class TransporterModule {}
