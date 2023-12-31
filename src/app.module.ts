/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';
import { RecyclingCentreModule } from './recycling_centre/recycling_centre.module';
import { DiyWorkshopModule } from './diy_workshop/diy_workshop.module';
import { SimpleUserModule } from './simple_user/simple_user.module';
import { TransporterModule } from './transporter/transporter.module';
import { OfferModule } from './offer/offer.module';


@Module({
  imports: [
		ConfigModule.forRoot({
		        envFilePath: '.env',
		        isGlobal: true,
    }),
    MongooseModule.forRoot(process.env.DB_URI),
    RecyclingCentreModule,
    DiyWorkshopModule,
    SimpleUserModule,
    TransporterModule,
    OfferModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
