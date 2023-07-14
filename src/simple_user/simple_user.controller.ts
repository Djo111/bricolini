/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Body, Patch, Param, Delete, UseGuards, Request,UseInterceptors, UploadedFile, } from '@nestjs/common';
import { SimpleUserService } from './simple_user.service';
import { CreateSimpleUserDto } from './dto/create-simple_user.dto';
import { UpdateSimpleUserDto } from './dto/update-simple_user.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import {diskStorage} from 'multer';
import { Observable, of } from 'rxjs';
import { v4 as uuidv4 } from 'uuid';
import path = require('path');
import { join } from 'path';
import { JwtAuthGuard } from 'src/auth/guards/jwt-guard';
import { User } from 'src/auth/schemas/user.schema';



@Controller('simple-user')
export class SimpleUserController {
  constructor(private readonly simpleUserService: SimpleUserService) {}

  @Post()
  create(@Body() createSimpleUserDto: CreateSimpleUserDto) {
    return this.simpleUserService.create(createSimpleUserDto);
  }
  



  @Get()
  findAll() {
    return this.simpleUserService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.simpleUserService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateSimpleUserDto: UpdateSimpleUserDto) {
    return this.simpleUserService.update(id, updateSimpleUserDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.simpleUserService.remove(id);
  }
}
