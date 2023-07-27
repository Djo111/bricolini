/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { CreateOfferDto } from './dto/create-offer.dto';
import { UpdateOfferDto } from './dto/update-offer.dto';
import { Offer } from './schemas/offer.schema';
import json;

import { spawn } from 'child_process';
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
    return this.offerrModel.find({id_recyclingCenter:null}).exec();
  }
  async findPendingOffers(id_RecyclingCenter:string): Promise<Offer[]>{
    return this.offerrModel.find({id_recyclingCenter:id_RecyclingCenter}).exec()
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
  async verifyFile(imageUrl : String){

    const pythonProcess = spawn('python3', ['IA_MODEL\main.py', imageUrl]);

    pythonProcess.stdout.on('data', (data) => {
      const probaDistribution = json.loads(data)["probability distribution"];
      const garageType = json.loads(data)["Garbage type"];

      if (Math.max(probaDistribution) >= 0.6) {
        const offer =await this.offerrModel.findOfferByImgUrl(imageUrl);
        offer.status=1;
        await offer.save();

      } else {
        const offer =await this.offerrModel.findOfferByImgUrl(imageUrl);
        offer.status=0;
        await offer.save();
      }
    });

    pythonProcess.stderr.on('data', (data) => {
      console.error(data.toString());
      return { error: 'Verification process failed' };
    });
    return { processing: true };
}
async findOfferByImgUrl(imageUrl : String) : Promise<Offer>{
  return this.offerrModel.find({img:imageUrl}).exec();

}
}
