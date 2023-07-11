/* eslint-disable prettier/prettier */
import { PartialType } from '@nestjs/mapped-types';
import { CreateSimpleUserDto } from './create-simple_user.dto';

export class UpdateSimpleUserDto extends PartialType(CreateSimpleUserDto) {
    readonly name?: string;
    readonly email?: string;
    readonly password?: string;
    readonly telephone?: number;  
}
