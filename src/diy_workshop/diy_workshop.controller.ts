import { Body, Controller, Delete, Get, Param, Post, Put } from '@nestjs/common';
import { DiyWorkshopService } from './diy_workshop.service';
import { DIY_workshop } from './schemas/diy_workshop.schema';
import { CreatDiyworkshopDto } from './dto/create-diyworshop.dto';
import { UpdateDiyworkshopDto } from './dto/update-diyworkshop.dto';

@Controller('diy-workshop')
export class DiyWorkshopController {
    constructor(
        private diyworkshopService: DiyWorkshopService
    ) {}
    
    @Get()
    async getAllDiyWorkshops(): Promise<DIY_workshop[]>{
        return this.diyworkshopService.findAll();
    }
    
    @Post()
    async createDiyworkshop(
        @Body()
        diyworkshop: CreatDiyworkshopDto
    ): Promise<DIY_workshop>{
        return this.diyworkshopService.create(diyworkshop);
    }
    
    
    @Get(':id')
    async getlDiyWorkshops(
        @Param('id')
        id: string,
    ): Promise<DIY_workshop>{
        return this.diyworkshopService.findById(id);
    }

    @Put(':id')
    async updateDiyworkshop(
        @Param('id')
        id: string,
        @Body()
        diyworkshop: UpdateDiyworkshopDto
    ): Promise<DIY_workshop>{
        return this.diyworkshopService.updateById(id, diyworkshop);
    }

    @Delete(':id')
    async deleteDiyworkshop(
        @Param('id')
        id:string,
    ) {
        return this.diyworkshopService.remove(id);
    }
}
