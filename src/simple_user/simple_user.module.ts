/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { SimpleUserService } from './simple_user.service';
import { SimpleUserController } from './simple_user.controller';
import { MongooseModule } from '@nestjs/mongoose';
import { SimpleUser, SimpleUserSchema } from './schemas/simple_user.schema';

@Module({
  imports: [MongooseModule.forFeature([{ name: SimpleUser.name, schema: SimpleUserSchema }])],
  controllers: [SimpleUserController],
  providers: [SimpleUserService]
})
export class SimpleUserModule {}
