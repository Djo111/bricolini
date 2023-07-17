import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { RecyclingCentreService } from './recycling_centre.service';
import { Offer } from 'src/offer/schemas/offer.schema';

import { User } from 'src/auth/schemas/user.schema';

@Controller('recycling-centre')
export class RecyclingCentreController {
    constructor(private recyclingCenterservice: RecyclingCentreService) { }
    
   
    @Get("/offers")
    async getAllOffers(): Promise<Offer[]>{
        return this.recyclingCenterservice.getallOffers()
    }

    
   
    @Get("transporter/:id")
    async selectTransporter(
        @Param('id')
        id: string
    ): Promise<User>{
        return this.recyclingCenterservice.findTransporterById(id)
        }

   
}
