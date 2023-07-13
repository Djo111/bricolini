/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Body, Patch, Param, Delete, UseInterceptors, UploadedFile, UseGuards } from '@nestjs/common';
import { OfferService } from './offer.service';
import { CreateOfferDto } from './dto/create-offer.dto';
import { UpdateOfferDto } from './dto/update-offer.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import {diskStorage} from 'multer';
import { Observable, of } from 'rxjs';
import { v4 as uuidv4 } from 'uuid';
//mport path from 'path';
import path = require('path');
import { join } from 'path';
import { JwtAuthGuard } from 'src/guards/jwt-guard';
import { Offer } from './schemas/offer.schema';


export const storage = {
  storage : diskStorage({
    destination : "./uploads",
    filename : (req , file , cb) => {
      const filename : string = path.parse(file.originalname).name.replace(/\s/g,'') + uuidv4();
      const extension : string = path.parse(file.originalname).ext;
      cb(null , `${file.originalname}${extension}`)
    }
  })

}
@Controller('offer')
export class OfferController {
  constructor(private readonly offerService: OfferService) {}

  /*@Post()
  @UseInterceptors(FileInterceptor('file' , {
    storage : diskStorage({
      destination : "./uploads",
      filename : (req , file , cb) => {
        cb(null , `${file.originalname}`)
      }
    })
  }))
  async uploadFile() {
    
    return "success";
  }*/
  
  create(@Body() createOfferDto: CreateOfferDto) {
    
    return this.offerService.create(createOfferDto);
  }

  @Get()
  findAll() {
    return this.offerService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.offerService.findOne(id);
  }


  @Post()
  @UseInterceptors(FileInterceptor('file', storage))

  uploadFile(@UploadedFile() file) : Observable<Object>{
    console.log(file);
    return of({imagePath : file.filename});
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateOfferDto: UpdateOfferDto) {
    return this.offerService.update(id, updateOfferDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.offerService.remove(id);
  }
}
