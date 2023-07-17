/* eslint-disable prettier/prettier */
/* eslint-disabl  e prettier/prettier */
import { Module } from '@nestjs/common';
import { AdminService } from './admin.service';
import { AdminController } from './admin.controller';
import { AuthService } from 'src/auth/auth.service';
import { MongooseModule } from '@nestjs/mongoose';
import { Admin, AdminSchema } from './schemas/admin.schema';
import { Offer, OfferSchema } from 'src/offer/schemas/offer.schema';
import { User, UserSchema } from 'src/auth/schemas/user.schema';
import { JwtService } from '@nestjs/jwt';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Admin.name, schema: AdminSchema },
      { name: Offer.name, schema: OfferSchema },
      { name: User.name, schema: UserSchema },
    ]),
  ],
  controllers: [AdminController],
  providers: [AdminService,AuthService,JwtService]
})
export class AdminModule {}
