import { waste_type } from "../schemas/diy_workshop.schema";

export enum category{
    DIY_WORKSHOP = "DIY workshop",
    RECYCLiNG_CENTER = "Recycling center",
    SIMPLE_USER = "Simple user",
    TRANSPORTER = "Transporter"

}

export class CreatDiyworkshopDto{
    
    readonly email: string;
    readonly username: string;    
    readonly password: string;
    readonly phoneNumber: string
    readonly address: string;
    readonly diy_waste_type: waste_type;
    readonly categ: category
}