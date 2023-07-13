import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
export enum categ{
    DIY_WORKSHOP = "DIY workshop",
    RECYCLiNG_CENTER = "Recycling center",
    SIMPLE_USER = "Simple user",
    TRANSPORTER = "Transporter"

}

export enum waste_type{
    IRON_WASTE = 'iron waste',
    WOOD_WASTE = 'wood waste',
    CONTSRUCTION_WASTE = 'construction waste',
    OTHERS= 'others'
}

@Schema({
    timestamps: true
})
export class User{

    @Prop()
    username: string;
    @Prop({ unique: [true, 'Email already exist!'] })
    email: string;
    @Prop()
    password: string;
    @Prop()
    category: categ;
    @Prop()
    phoneNumber: number;
    @Prop()
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

export const UserSchema = SchemaFactory.createForClass(User);