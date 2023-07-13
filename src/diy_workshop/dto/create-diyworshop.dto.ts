import { waste_type } from "../schemas/diy_workshop.schema";


export class CreatDiyworkshopDto{
    readonly _id: string;
    readonly email: string;
    readonly username: string;    
    readonly password: string;
    readonly phoneNumber: string
    readonly address: string;
    readonly diy_waste_type: waste_type
}