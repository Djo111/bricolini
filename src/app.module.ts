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
import { AuthModule } from './auth/auth.module';
import { AdminModule } from './admin/admin.module';
import {IAModule} from './Ia_model/ia.module'




@Module({
  imports: [
		ConfigModule.forRoot({
		        envFilePath: '.env',
		        isGlobal: true,
    }),
    MongooseModule.forRoot(process.env.DB_URI),
    RecyclingCentreModule,
    DiyWorkshopModule,
    AuthModule,
    SimpleUserModule,
    TransporterModule,
    OfferModule,
    AdminModule,
    
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
