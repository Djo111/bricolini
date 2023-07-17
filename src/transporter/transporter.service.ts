/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { OfferService } from 'src/offer/offer.service';
import { Offer } from 'src/offer/schemas/offer.schema';
@Injectable()
export class TransporterService {
  constructor(
    private offerservice: OfferService,
   
  ) {}
    
  async getoffers(id: string): Promise<Offer[]>{
    return this.offerservice.findoffer_transporter(id)
  }
 
}
