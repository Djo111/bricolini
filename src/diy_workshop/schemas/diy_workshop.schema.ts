import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { v4 as uuidv4 } from 'uuid';

export enum waste_type{
    IRON_WASTE = 'iron waste',
    WOOD_WASTE = 'wood waste',
    CONTSRUCTION_WASTE = 'construction waste',
    OTHERS= 'others'
}

@Schema({
    timestamps: true
})
export class DIY_workshop {

    @Prop({ default: uuidv4 })
    _id: string;

    @Prop({required: true})
    email: string;

    @Prop({ required: true })
    username: string;    

    @Prop({ required: true })
    password: string;

    @Prop({ required: true })
    phoneNumber: String

    @Prop({ required: true })
    address: string;

    @Prop({ required: true })
    diy_waste_type: waste_type
}

export const DiyworshopSchema= SchemaFactory.createForClass(DIY_workshop)