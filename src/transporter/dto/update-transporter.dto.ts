/* eslint-disable prettier/prettier */
import { PartialType } from '@nestjs/mapped-types';
import { CreateTransporterDto } from './create-transporter.dto';

export class UpdateTransporterDto extends PartialType(CreateTransporterDto) {
    readonly name?: string;
    readonly email?: string;
    readonly password?: string;
    readonly telephone?: number;
    readonly region?: string;
}
