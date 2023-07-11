/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { CreateTransporterDto } from './dto/create-transporter.dto';
import { UpdateTransporterDto } from './dto/update-transporter.dto';
import { Transporter } from './schemas/transporter.schema';

@Injectable()
export class TransporterService {
  constructor(
    @InjectModel(Transporter.name)
    private readonly transporterModel: Model<Transporter>,
  ) {}

  async create(createTransporterDto: CreateTransporterDto): Promise<Transporter> {
    const createdTransporter = new this.transporterModel(createTransporterDto);
    return createdTransporter.save();
  }

  async findAll(): Promise<Transporter[]> {
    return this.transporterModel.find().exec();
  }

  async findById(id: string): Promise<Transporter> {
    return this.transporterModel.findById(id).exec();
  }

  async update(id: string, updateTransporterDto: UpdateTransporterDto): Promise<Transporter> {
    return this.transporterModel.findByIdAndUpdate(id, updateTransporterDto, { new: true }).exec();
  }

  async delete(id: string): Promise<void> {
    await this.transporterModel.findByIdAndRemove(id).exec();
  }
}
