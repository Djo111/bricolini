import { Module } from '@nestjs/common';
import { RecyclingCentreController } from './recycling_centre.controller';
import { RecyclingCentreService } from './recycling_centre.service';
import { MongooseModule } from '@nestjs/mongoose';
import { RecyclingCentreSchema } from './schemas/recycling_centre.schema';

@Module({
  imports: [MongooseModule.forFeature([{name:'Recycling_centre', schema:  RecyclingCentreSchema}])],
  controllers: [RecyclingCentreController],
  providers: [RecyclingCentreService]
})
export class RecyclingCentreModule {}
