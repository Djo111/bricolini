import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { DIY_workshop } from './schemas/diy_workshop.schema';
import * as mongoose from 'mongoose';
import { CreatDiyworkshopDto } from './dto/create-diyworshop.dto';
import * as bcrypt from 'bcryptjs';
import { JwtService } from '@nestjs/jwt';
import { AuthService } from 'src/auth/auth.service';

@Injectable()
export class DiyWorkshopService {
    constructor(
        @InjectModel(DIY_workshop.name)
        private diyWorkshopModel: mongoose.Model<DIY_workshop>,
        
        private authservice: AuthService
    ) { }

    async findAll(): Promise<DIY_workshop[]> {
        const diyWorkshops = await this.diyWorkshopModel.find();
        return diyWorkshops;
    }

    async create(diyworkshop: DIY_workshop): Promise<DIY_workshop> {
        const res = await this.diyWorkshopModel.create(diyworkshop);
        return res;
    }

    async findById(id: string): Promise<DIY_workshop> {
        const diyworkshop = await this.diyWorkshopModel.findById(id);
        if (!diyworkshop) {
            throw new NotFoundException('DIY workshop not found!')
        }
        return diyworkshop;
    }
    
    async updateById(id: string, diyworkshop: DIY_workshop): Promise<DIY_workshop> {
        return await this.diyWorkshopModel.findByIdAndUpdate(id, diyworkshop, {
            new: true,
            runValidators: true,
        });
          
    }
    
    async remove(id: string): Promise<string> {
        await this.diyWorkshopModel.findByIdAndRemove(id);
        return 'DIY Workshop Removed'
    }


}