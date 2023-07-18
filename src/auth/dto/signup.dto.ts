/* eslint-disable prettier/prettier */
import { Prop } from "@nestjs/mongoose";
import { IsEmail, IsNotEmpty, IsString, MinLength} from "class-validator";
import { categ, waste_type } from "../schemas/user.schema";

export class SignUpDto{

    @IsNotEmpty()
    username: string;

    @IsNotEmpty()
    @Prop({ unique: [true, 'Email already exist!'] })
    @IsEmail({},{message:"please enter correct email"})
    email: string;

    @IsNotEmpty()
    @IsString()
    @MinLength(6)
    password: string;
    
    @IsNotEmpty()
    category: categ;

    @Prop()
    phoneNumber: number;

    @Prop()
    @IsString()
    address: string;

    @Prop()
    diy_waste_type: waste_type;
    @Prop()
    region: string;

    @Prop()
    number_of_small_trucks: number;
    @Prop()
    number_of_medium_trucks: number;
    @Prop()
    number_of_big_trucks: number;
    
}