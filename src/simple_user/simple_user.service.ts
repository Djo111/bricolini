/* eslint-disable prettier/prettier */
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { CreateSimpleUserDto } from './dto/create-simple_user.dto';
import { UpdateSimpleUserDto } from './dto/update-simple_user.dto';
import { SimpleUser } from './schemas/simple_user.schema';


@Injectable()
export class SimpleUserService {
  constructor(
    @InjectModel(SimpleUser.name)
    private readonly simpleUserModel: Model<SimpleUser>,
  ) {}

  async create(createUserDto: CreateSimpleUserDto): Promise<SimpleUser> {
    const createdUser = new this.simpleUserModel(createUserDto);
    return createdUser.save();
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