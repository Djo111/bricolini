import { Module } from '@nestjs/common';
import { DiyWorkshopController } from './diy_workshop.controller';
import { DiyWorkshopService } from './diy_workshop.service';
import { MongooseModule } from '@nestjs/mongoose';
import { DiyworshopSchema } from './schemas/diy_workshop.schema';

import { PassportModule } from '@nestjs/passport';
import { JwtModule } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { AuthModule } from 'src/auth/auth.module';

@Module({
  imports: [PassportModule.register({ defaultStrategy: 'jwt' }),
    JwtModule.registerAsync({
      inject: [ConfigService],
      useFactory: (config: ConfigService) => {
        return {
          secret: config.get<string>("JWT_SECRET"),
          signOptions: {
            expiresIn: config.get<string | number>("JWT_EXPIRES")
          }
        };
      }
    }),
    MongooseModule.forFeature([{ name: 'DIY_workshop', schema: DiyworshopSchema }]),
    AuthModule
  ],
  controllers: [DiyWorkshopController],
  providers: [DiyWorkshopService]
})
export class DiyWorkshopModule {}
