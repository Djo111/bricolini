/* eslint-disable prettier/prettier */

import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { v4 as uuid } from 'uuid';
@Schema({
    timestamps:true
})
export class Transporter {
    @Prop({ default: uuid })
    _id:string
    @Prop()
    name:string
    @Prop()
    email:string
    @Prop()
    password:string
    @Prop()
    telephone:number
    @Prop()
    region:string
}
export const TransporterSchema=SchemaFactory.createForClass(Transporter)