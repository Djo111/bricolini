/* eslint-disable prettier/prettier */
import { PartialType } from '@nestjs/mapped-types';
import { CreateOfferDto } from './create-offer.dto';

export class UpdateOfferDto extends PartialType(CreateOfferDto) {
    readonly img?:string
    readonly location?:string
    readonly paid?:boolean
    readonly price?:number
}
