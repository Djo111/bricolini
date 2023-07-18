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
    private readonly offerrModel: Model<Offer>,
  ) {}

  async createNewOffer(offerdto: CreateOfferDto): Promise<Offer> {
    const createdoffer= new this.offerrModel(offerdto);
    createdoffer.status=0;
    return createdoffer.save();
  }
  async findAllOffers(): Promise<Offer[]> {
    return this.offerrModel.find().exec();
  }
  async findAllVerifiedOffers(): Promise<Offer[]> {
    return this.offerrModel.find({status:1}).exec();
  }
  async findAllNotVerifiedOffers(): Promise<Offer[]> {
    return this.offerrModel.find({status:0}).exec();
  }
  
  async findoffer_transporter(id: string): Promise<Offer[]>{
    return this.offerrModel.find({id_transporter:id})
  }
  async findOne(id: string): Promise<Offer> {
    return this.offerrModel.findById(id).exec();
  }

  async update(id: string, offerDto): Promise<Offer> {
    return this.offerrModel.findByIdAndUpdate(id, offerDto, { new: true }).exec();
  }

  async remove(id: string): Promise<void> {
    await this.offerrModel.findByIdAndRemove(id).exec();
  }
}
