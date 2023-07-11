import { Module } from '@nestjs/common';
import { DiyWorkshopController } from './diy_workshop.controller';
import { DiyWorkshopService } from './diy_workshop.service';

@Module({
  controllers: [DiyWorkshopController],
  providers: [DiyWorkshopService]
})
export class DiyWorkshopModule {}
