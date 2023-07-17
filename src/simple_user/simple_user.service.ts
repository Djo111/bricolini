/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { OfferService } from 'src/offer/offer.service';
import { CreateOfferDto } from 'src/offer/dto/create-offer.dto';
import { Offer } from 'src/offer/schemas/offer.schema';
import { UpdateOfferDto } from 'src/offer/dto/update-offer.dto';


@Injectable()
export class SimpleUserService {
  constructor(
    private offerservice: OfferService
  ) {}

  
  
  async createOffer(offerdto: CreateOfferDto): Promise<Offer> {
    const res = await this.offerservice.createNewOffer(offerdto)
    return res;
  }
  async removeOffer(id: string):Promise<string> {
    this.offerservice.remove(id);
    return "offer removed."
  }
  async updateOffer(id: string, offerdto: UpdateOfferDto): Promise<Offer>{
    return this.offerservice.update(id, offerdto)
  }


}