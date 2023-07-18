/* eslint-disable prettier/prettier */
import { PartialType } from '@nestjs/mapped-types';
import { CreateOfferDto } from './create-offer.dto';

export class UpdateOfferDto extends PartialType(CreateOfferDto) {
    _id: string
    readonly id_offerProvider:string
    readonly img?:string
    readonly location?:string
    readonly paid?:boolean
    readonly price?: number
     id_recyclingCenter: string
     id_transporter: string
}
