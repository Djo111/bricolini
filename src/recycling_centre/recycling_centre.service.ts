import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel, MongooseModule } from '@nestjs/mongoose';
import { Recycling_centre } from './schemas/recycling_centre.schema';
import * as mongoose from 'mongoose';
import { Offer } from 'src/offer/schemas/offer.schema';
import { OfferService } from 'src/offer/offer.service';

@Injectable()
export class RecyclingCentreService {
    constructor(
        @InjectModel(Recycling_centre.name)
        private recyclingcentreModel: mongoose.Model<Recycling_centre>,
        private offerservice: OfferService
    ) { }
    
    async getallOffers(): Promise<Offer[]>{
        return this.offerservice.findAllOffers()
    }
    async findAll(): Promise<Recycling_centre[]> {
        const recyclingCenters = await this.recyclingcentreModel.find()
        return recyclingCenters
    }

    async create(recyclingcenter: Recycling_centre): Promise<Recycling_centre>{
        const res = await this.recyclingcentreModel.create(recyclingcenter)
        return res
    }
     async findById(id: string): Promise<Recycling_centre>{
         const res = await this.recyclingcentreModel.findById(id);
         if (!res) {
             throw new NotFoundException('Recycling center not found!')
         }
        return res
     }
    
     async updateById(id: string, recyclingcenter: Recycling_centre): Promise<Recycling_centre> {
        return await this.recyclingcentreModel.findByIdAndUpdate(id, recyclingcenter, {
            new: true,
            runValidators: true,
        });
     }
    
    async remove(id: string):Promise<string> {
        await this.recyclingcentreModel.findByIdAndRemove(id);
        return 'Recycling Center Removed.'
        
    }
}
