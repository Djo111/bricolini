import { Module } from '@nestjs/common';
import { RecyclingCentreController } from './recycling_centre.controller';
import { RecyclingCentreService } from './recycling_centre.service';

@Module({
  controllers: [RecyclingCentreController],
  providers: [RecyclingCentreService]
})
export class RecyclingCentreModule {}
