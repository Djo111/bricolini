import { waste_type } from "../schemas/recycling_centre.schema";



export class UpdateRecylingcenterDto{
    readonly _id: string;
    readonly email: string;
    readonly username: string;    
    readonly password: string;
    readonly phoneNumber: string
    readonly address: string;
    readonly diy_waste_type: waste_type
}