import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";



@Schema({
    timestamps: true
})
export class User{
    
    @Prop({ required: true })
    username: string;
    @Prop({ required: true })
    password: string;
    @Prop({ unique:[true, 'Email already exist!'] })
    email: string

}

export const UserSchema = SchemaFactory.createForClass(User);