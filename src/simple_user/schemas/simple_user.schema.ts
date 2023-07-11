/* eslint-disable prettier/prettier */

import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { v4 as uuid } from 'uuid';
@Schema({
    timestamps:true
})
export class SimpleUser {
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
}
export const SimpleUserSchema=SchemaFactory.createForClass(SimpleUser)    
