/* eslint-disable prettier/prettier */
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel, MongooseModule } from '@nestjs/mongoose';
import * as mongoose from 'mongoose';
import { Offer } from 'src/offer/schemas/offer.schema';
import { OfferService } from 'src/offer/offer.service';
import { AuthService } from 'src/auth/auth.service';
import { categ, User } from 'src/auth/schemas/user.schema';
import { UpdateOfferDto } from 'src/offer/dto/update-offer.dto';
import { plainToClass } from 'class-transformer';
import { AddsService } from 'src/adds/adds.service';
import { Add } from 'src/adds/schemas/addds.schema';

@Injectable()
export class RecyclingCentreService {
    constructor(
        private offerservice: OfferService,
        private authservice: AuthService,
        private addservice: AddsService
    ) { }

    
    async getallOffers(): Promise<Offer[]>{
        return this.offerservice.findAllOffers()
    }
    
    async getallAdds(): Promise<Add[]>{
        return this.addservice.getVerifiedAdds()
    }

    async selectOffer(offer_id: string, id_RC:string) {
        
        const update_offer = await this.offerservice.findOne(offer_id);
        update_offer.id_recyclingCenter = id_RC;
       
        this.offerservice.update(offer_id, update_offer)
      
    }
    async selectTransporter(offer_id: string, id_Transp: string) {
        const updateoffer = await this.offerservice.findOne(offer_id)
        updateoffer.id_transporter = id_Transp;
        this.offerservice.update(offer_id, updateoffer)
      
    }   
    async getallTransporters(category: categ): Promise<User[]>{
        const res = await this.authservice.findByCategory(category);
         if (!res) {
             throw new NotFoundException('Transporter not found!')
         }
        return res
    }
    
    async getPendingOffers(id_RecyclingCenter:string): Promise<Offer[]>{
        return this.offerservice.findPendingOffers(id_RecyclingCenter)
    }
     
}
