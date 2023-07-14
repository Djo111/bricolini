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
    private readonly offerModel: Model<Offer>,
  ) {}

  async create(createOfferDto: CreateOfferDto): Promise<Offer> {
    const createdOffer = new this.offerModel(createOfferDto);
    return createdOffer.save();
  }

  async findAll(): Promise<Offer[]> {
    return this.offerModel.find().exec();
  }

  async findOne(id: string): Promise<Offer> {
    return this.offerModel.findById(id).exec();
  }

  async update(id: string, updateOfferrDto: UpdateOfferDto): Promise<Offer> {
    return this.offerModel.findByIdAndUpdate(id, updateOfferrDto, { new: true }).exec();
  }

  async remove(id: string): Promise<void> {
    await this.offerModel.findByIdAndRemove(id).exec();
  }
}
