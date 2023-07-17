import { Module } from '@nestjs/common';
import { RecyclingCentreController } from './recycling_centre.controller';
import { RecyclingCentreService } from './recycling_centre.service';
import { MongooseModule } from '@nestjs/mongoose';
import { OfferModule } from 'src/offer/offer.module';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [
    OfferModule,
    AuthModule
  ],
  controllers: [RecyclingCentreController],
  providers: [RecyclingCentreService]
})
export class RecyclingCentreModule {}
