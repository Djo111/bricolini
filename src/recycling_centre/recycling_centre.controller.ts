import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { RecyclingCentreService } from './recycling_centre.service';
import { Recycling_centre } from './schemas/recycling_centre.schema';
import { CreatRecylingcenterDto } from './dto/create-recyclingcenter.dto';
import { UpdateRecylingcenterDto } from './dto/update-recyclingcenter.dto';

@Controller('recycling-centre')
export class RecyclingCentreController {
    constructor(private recyclingCenterservice: RecyclingCentreService) { }
    
    @Get()
     async getAllRecyclingCenters(): Promise<Recycling_centre[]>{
        return this.recyclingCenterservice.findAll()
    }

    @Post()  
    async createRecyclingCenter(
        @Body()
        recyclingcenter: CreatRecylingcenterDto
    ): Promise<Recycling_centre>{
        return this.recyclingCenterservice.create(recyclingcenter)
    }

    @Get(':id')
    async getRecyclingCenters(
        @Param('id')
        id: string,
     ): Promise<Recycling_centre>{
        return this.recyclingCenterservice.findById(id)
    }

    @Put(':id')
    async updateRecylingcenter(
        @Param('id')
        id: string,
        @Body()
        recyclingcenter: UpdateRecylingcenterDto
    ): Promise<Recycling_centre>{
        return this.recyclingCenterservice.updateById(id, recyclingcenter);
    }

    @Delete(':id')
    async deleteRecyclingcenter(
        @Param('id')
        id:string,
    ) {
        return this.recyclingCenterservice.remove(id);
    }
}
