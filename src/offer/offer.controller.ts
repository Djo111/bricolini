/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Body, Patch, Param, Delete, UseInterceptors, UseGuards, UploadedFile } from '@nestjs/common';
import { OfferService } from './offer.service';
import { CreateOfferDto } from './dto/create-offer.dto';
import { UpdateOfferDto } from './dto/update-offer.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import path = require('path');
import { join } from 'path';
import { v4 as uuidv4 } from 'uuid';
import { Observable, of } from 'rxjs';

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

  @Post()
  @UseInterceptors(FileInterceptor('file' , {
    storage : diskStorage({
      destination : "./uploads",
      filename : (req , file , cb) => {
        cb(null , `${file.originalname}`)
      }
    })
  }))
  create(@Body() createOfferDto: CreateOfferDto) {
    
    return this.offerService.createNewOffer(createOfferDto);
  }

  @Get()
  findAll() {
    return this.offerService.findAllOffers();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.offerService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateOfferDto: UpdateOfferDto) {
    return this.offerService.update(id, updateOfferDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.offerService.remove(id);
  }


  /*@UseGuards(JwtAuthGuard)
  @Post()
  @UseInterceptors(FileInterceptor('file', storage))
  uploadFile(@UploadedFile() file) : Observable<Object>{
    //const user: User =req.user.user;
    //console.log(user)
    console.log(file);
    return of({imagePath : file.filename});
  }*/
}


