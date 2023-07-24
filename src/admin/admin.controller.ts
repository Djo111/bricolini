/* eslint-disable prettier/prettier */
import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { categ, User } from 'src/auth/schemas/user.schema';
import { Offer } from 'src/offer/schemas/offer.schema';
import { AdminService } from './admin.service';
import { CreateAdminDto } from './dto/create-admin.dto';
import { UpdateAdminDto } from './dto/update-admin.dto';

@Controller('admin')
export class AdminController {
  constructor(private readonly adminService: AdminService) {}
  @Get('offers')
  async getOffers(): Promise<Offer[]> {
    return this.adminService.getAllNotVerifiedOffers();
  }
  @Post()
  create(@Body() createAdminDto: CreateAdminDto) {
    return this.adminService.create(createAdminDto);
  }

  @Get()
  findAll() {
    return this.adminService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.adminService.findById(id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateAdminDto: UpdateAdminDto) {
    return this.adminService.update(id, updateAdminDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.adminService.delete(id);
  }
  @Post('offers/:offerId/accept')
  async acceptOffer(@Param('offerId') offerId: string): Promise<void> {
    return this.adminService.acceptOffer(offerId);
  }

  @Delete('offers/:offerId')
  async deleteOffer(@Param('offerId') offerId: string): Promise<void> {
    return this.adminService.deleteOffer(offerId);
  }

  @Get('users/:category')
  async getAllUsersByCategory(@Param('category') category: categ): Promise<User[]> {
    return this.adminService.getAllUsersByCategory(category);
  }
}
