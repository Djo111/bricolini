import { Module } from '@nestjs/common';
import { DiyWorkshopController } from './diy_workshop.controller';
import { DiyWorkshopService } from './diy_workshop.service';
import { MongooseModule } from '@nestjs/mongoose';
import { DiyworshopSchema } from './schemas/diy_workshop.schema';

@Module({
  imports: [MongooseModule.forFeature([{name:'DIY_workshop' ,schema:DiyworshopSchema}])],
  controllers: [DiyWorkshopController],
  providers: [DiyWorkshopService]
})
export class DiyWorkshopModule {}
