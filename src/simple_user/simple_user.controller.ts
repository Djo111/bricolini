/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { SimpleUserService } from './simple_user.service';
import { CreateSimpleUserDto } from './dto/create-simple_user.dto';
import { UpdateSimpleUserDto } from './dto/update-simple_user.dto';
import { CreateOfferDto } from 'src/offer/dto/create-offer.dto';
import { UpdateOfferDto } from 'src/offer/dto/update-offer.dto';

@Controller('simple-user')
export class SimpleUserController {
  constructor(private readonly simpleUserService: SimpleUserService) {}

  @Post()
  create(@Body() createSimpleUserDto: CreateSimpleUserDto) {
    return this.simpleUserService.create(createSimpleUserDto);
  }


  @Post("/offers")
  async CreatOffer(
    @Body()
    offerdto: CreateOfferDto
  ) {
    return this.simpleUserService.createOffer(offerdto)
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
  @Patch("offers/:id")
  updateOffer(
    @Param('id')
    id: string,
    @Body()
    updateofferdto:UpdateOfferDto
  ) {
    return this.simpleUserService.updateOffer(id, updateofferdto)
    }
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.simpleUserService.remove(id);
  }

  @Delete("offers/:id")
  RemoveOffer(
    @Param('id')
    id: string
  ) {
    return this.simpleUserService.removeOffer(id)
  }
}
