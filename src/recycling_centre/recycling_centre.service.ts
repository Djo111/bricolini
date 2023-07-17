/* eslint-disable prettier/prettier */
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel, MongooseModule } from '@nestjs/mongoose';

import * as mongoose from 'mongoose';
import { Offer } from 'src/offer/schemas/offer.schema';
import { OfferService } from 'src/offer/offer.service';
import { AuthService } from 'src/auth/auth.service';
import { User } from 'src/auth/schemas/user.schema';

@Injectable()
export class RecyclingCentreService {
    constructor(
        private offerservice: OfferService,
        private authservice: AuthService
    ) { }
    
    async getallOffers(): Promise<Offer[]>{
        return this.offerservice.findAllOffers()
    }
   
    async findTransporterById(id: string): Promise<User>{
        const res = await this.authservice.findOne(id);
         if (!res) {
             throw new NotFoundException('Transporter not found!')
         }
        return res
    }
    

        
}
