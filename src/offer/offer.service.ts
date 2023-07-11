/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { CreateOfferDto } from './dto/create-offer.dto';
import { UpdateOfferDto } from './dto/update-offer.dto';
import { Offer } from './schemas/offer.schema';

@Injectable()
export class OfferService {
  constructor(
    @InjectModel(Offer.name)
    private readonly transporterModel: Model<Offer>,
  ) {}

  async create(createTransporterDto: CreateOfferDto): Promise<Offer> {
    const createdTransporter = new this.transporterModel(createTransporterDto);
    return createdTransporter.save();
  }

  async findAll(): Promise<Offer[]> {
    return this.transporterModel.find().exec();
  }

  async findOne(id: string): Promise<Offer> {
    return this.transporterModel.findById(id).exec();
  }

  async update(id: string, updateTransporterDto: UpdateOfferDto): Promise<Offer> {
    return this.transporterModel.findByIdAndUpdate(id, updateTransporterDto, { new: true }).exec();
  }

  async remove(id: string): Promise<void> {
    await this.transporterModel.findByIdAndRemove(id).exec();
  }
}
