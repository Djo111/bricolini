/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { CreateSimpleUserDto } from './dto/create-simple_user.dto';
import { UpdateSimpleUserDto } from './dto/update-simple_user.dto';
import { SimpleUser } from './schemas/simple_user.schema';
import { OfferService } from 'src/offer/offer.service';
import { CreateOfferDto } from 'src/offer/dto/create-offer.dto';
import { Offer } from 'src/offer/schemas/offer.schema';
import { UpdateOfferDto } from 'src/offer/dto/update-offer.dto';


@Injectable()
export class SimpleUserService {
  constructor(
    @InjectModel(SimpleUser.name)
    private readonly simpleUserModel: Model<SimpleUser>,
    private offerservice: OfferService
  ) {}

  async create(createUserDto: CreateSimpleUserDto): Promise<SimpleUser> {
    const createdUser = new this.simpleUserModel(createUserDto);
    return createdUser.save();
  }
  
  async createOffer(offerdto: CreateOfferDto): Promise<Offer> {
    const res = await this.offerservice.createNewOffer(offerdto)
    return res;
  }
  async removeOffer(id: string):Promise<string> {
    this.offerservice.remove(id);
    return "offer removed."
  }
  async updateOffer(id: string, offerdto: UpdateOfferDto): Promise<Offer>{
    return this.offerservice.update(id, offerdto)
  }

  async findAll(): Promise<SimpleUser[]> {
    return this.simpleUserModel.find().exec();
  }

  async findOne(id: string): Promise<SimpleUser> {
    return this.simpleUserModel.findById(id).exec();
  }

  async update(id: string, updateUserDto: UpdateSimpleUserDto): Promise<SimpleUser> {
    return this.simpleUserModel.findByIdAndUpdate(id, updateUserDto, { new: true }).exec();
  }

  async remove(id: string): Promise<void> {
    await this.simpleUserModel.findByIdAndRemove(id).exec();
  }
}