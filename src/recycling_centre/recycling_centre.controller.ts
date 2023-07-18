/* eslint-disable prettier/prettier */
import { Body, Controller, Delete, Get, Param, Patch, Post, Put } from '@nestjs/common';
import { RecyclingCentreService } from './recycling_centre.service';
import { Offer } from 'src/offer/schemas/offer.schema';

import { User, categ } from 'src/auth/schemas/user.schema';

@Controller('recycling-centre')
export class RecyclingCentreController {
    constructor(private recyclingCenterservice: RecyclingCentreService) { }
    
   
    @Get("/offers")
    async getAllOffers(): Promise<Offer[]>{
        return this.recyclingCenterservice.getallOffers()
    }

    
   
    @Get("transporters/:category")
    async GetTransporters(
        @Param('category')
        category: categ
    ): Promise<User[]>{
        return this.recyclingCenterservice.getallTransporters(category)
        }

    @Put(':id_RC/offers/:offer_id/select')
  async selectOffer(
    @Param('offer_id') offerId: string,
    @Param('id_RC') recyclingCenterId: string,
  ) {
    await this.recyclingCenterservice.selectOffer(offerId, recyclingCenterId);
    return { message: 'Offer selected successfully' };
    }
    
    @Put('offers/:offer_id/transporter/:id_transp')
     async selectTransporter(
    @Param('offer_id') offerId: string,
    @Param('id_transp') transporyterId: string,
  ) {
    await this.recyclingCenterservice.selectTransporter(offerId, transporyterId);
    return { message: 'Transporter selected successfully' };
  }

}
