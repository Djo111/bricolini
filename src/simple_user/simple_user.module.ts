/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { SimpleUserService } from './simple_user.service';
import { SimpleUserController } from './simple_user.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { OfferModule } from 'src/offer/offer.module';

@Module({
  imports: [
  OfferModule],
  controllers: [SimpleUserController],
  providers: [SimpleUserService]
})
export class SimpleUserModule {}
