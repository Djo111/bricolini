/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Put, Delete, Body, Param } from '@nestjs/common';
import { TransporterService } from './transporter.service';


@Controller('transporters')
export class TransporterController {
  constructor(private readonly transporterService: TransporterService) { }

}
