import { Module } from '@nestjs/common';
import { RecyclingCentreController } from './recycling_centre.controller';
import { RecyclingCentreService } from './recycling_centre.service';
import { MongooseModule } from '@nestjs/mongoose';
import { RecyclingCentreSchema } from './schemas/recycling_centre.schema';

import { OfferModule } from 'src/offer/offer.module';

@Module({
  imports: [MongooseModule.forFeature([{ name: 'Recycling_centre', schema: RecyclingCentreSchema }]),
    OfferModule
  ],
  controllers: [RecyclingCentreController],
  providers: [RecyclingCentreService]
})
export class RecyclingCentreModule {}
