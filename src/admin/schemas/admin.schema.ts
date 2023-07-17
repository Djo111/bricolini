import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';

/* eslint-disable prettier/prettier */
export class Admin {
     @Prop()
    email:string
    @Prop()
    password:string
}
export const AdminSchema = SchemaFactory.createForClass(Admin);
