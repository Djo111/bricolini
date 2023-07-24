// auth.service.ts
/* eslint-disable prettier/prettier */
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User, categ } from './schemas/user.schema';
import * as bcrypt from 'bcryptjs'
import { JwtService } from '@nestjs/jwt';
import { SignUpDto } from './dto/signup.dto';
import { LogInDto } from './dto/login.dto';

@Injectable()
export class AuthService {
  constructor(
    @InjectModel(User.name)
    private userModel: Model<User>,
    private jwtService: JwtService
  ) {}

  async signUp(signupDto: SignUpDto): Promise<{ token: string }> {
    const { username, email, password, category, phoneNumber, address, diy_waste_type, region,
      number_of_small_trucks, number_of_medium_trucks, number_of_big_trucks } = signupDto;
    
    const hashedPassword = await bcrypt.hash(password, 10);
    
    const user = await this.userModel.create({
      username,
      email,
      password: hashedPassword,
      category,
      phoneNumber,
      address,
      diy_waste_type,
      region,
      number_of_small_trucks,
      number_of_medium_trucks,
      number_of_big_trucks
    });

    const token = this.jwtService.sign({ id: user._id });
    console.log("signup done");
    return { token };
  }

  async login(logindto: LogInDto): Promise<{ token: string, category: categ }> {
    const { email, password } = logindto;
    const user = await this.userModel.findOne({ email });

    if (!user) {
      throw new UnauthorizedException("Invalid email!");
    }

    const isPasswordMatched = await bcrypt.compare(password, user.password);

    if (!isPasswordMatched) {
      throw new UnauthorizedException("Invalid email or password!");
    }

    const token = this.jwtService.sign({ id: user._id });

    return { token, category: user.category };
  }

  async findAll(): Promise<User[]> {
    return this.userModel.find().exec();
  }
  async findAllDIY(): Promise<User[]> {
    return this.userModel.find({category:"DIY workshop"}).exec();
  }
  async findAllRC(): Promise<User[]> {
    return this.userModel.find({category:"Recycling center"}).exec();
  }
  async findAllU(): Promise<User[]> {
    return this.userModel.find({category:"Simple user"}).exec();
  }
  async findAllT(): Promise<User[]> {
    return this.userModel.find({category:"Transporter"}).exec();
  }
  async findOne(id: string): Promise<User> {
    return this.userModel.findById(id).exec();
  }
  async findByCategory(catg: categ): Promise<User[]>{
    return this.userModel.find({category: catg})
  }

  async update(id: string, updateUserDto: SignUpDto): Promise<User> {
    return this.userModel.findByIdAndUpdate(id, updateUserDto, { new: true }).exec();
  }

  async remove(id: string): Promise<void> {
    await this.userModel.findByIdAndRemove(id).exec();
  }
}
