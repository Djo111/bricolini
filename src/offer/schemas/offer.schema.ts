/* eslint-disable prettier/prettier */

import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { v4 as uuid } from 'uuid';
@Schema({
    timestamps:true
})
export class Offer {
    @Prop({default:uuid})
    _id:string
    @Prop()
    img:string;
    @Prop()
    location: string;
    @Prop()
    price: number;
    @Prop()
    estimateddistance:number;
    @Prop()
    status:number
    @Prop()
    id_recyclingCenter: string;
    @Prop()
    id_transporter: string;
    @Prop()
    id_offerProvider: string

    
}
export const OfferSchema=SchemaFactory.createForClass(Offer)    