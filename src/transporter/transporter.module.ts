/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { TransporterService } from './transporter.service';
import { TransporterController } from './transporter.controller';
import { Mongoose } from 'mongoose';
import { MongooseModule } from '@nestjs/mongoose';
import { Transporter, TransporterSchema } from './schemas/transporter.schema';

@Module({
  imports: [MongooseModule.forFeature([{ name: Transporter.name, schema: TransporterSchema }])],
  controllers: [TransporterController],
  providers: [TransporterService]
})
export class TransporterModule {}
