/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Put, Delete, Body, Param } from '@nestjs/common';
import { CreateTransporterDto } from './dto/create-transporter.dto';
import { UpdateTransporterDto } from './dto/update-transporter.dto';
import { Transporter } from './schemas/transporter.schema';
import { TransporterService } from './transporter.service';


@Controller('transporters')
export class TransporterController {
  constructor(private readonly transporterService: TransporterService) {}

  @Post()
  async create(@Body() createTransporterDto: CreateTransporterDto): Promise<Transporter> {
    return this.transporterService.create(createTransporterDto);
  }

  @Get()
  async findAll(): Promise<Transporter[]> {
    return this.transporterService.findAll();
  }

  @Get(':id')
  async findById(@Param('id') id: string): Promise<Transporter> {
    return this.transporterService.findById(id);
  }

  @Put(':id')
  async update(@Param('id') id: string, @Body() updateTransporterDto: UpdateTransporterDto): Promise<Transporter> {
    return this.transporterService.update(id, updateTransporterDto);
  }

  @Delete(':id')
  async delete(@Param('id') id: string): Promise<void> {
    return this.transporterService.delete(id);
  }
}
