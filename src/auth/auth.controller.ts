// auth.controller.ts
import { Body, Controller, Delete, Get, Param, Patch, Post, Query } from '@nestjs/common';
import { AuthService } from './auth.service';
import { SignUpDto } from './dto/signup.dto';
import { LogInDto } from './dto/login.dto';
import { categ } from './schemas/user.schema';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post('/signup')
  SignUp(
    @Body() signupDto: SignUpDto
  ): Promise<{ token: string }> {
    console.log("controller");
    return this.authService.signUp(signupDto);
  }

  @Post('/user/login')
  Login(
    @Body() loginDto: LogInDto
  ): Promise<{ token: string, category: categ }> {
    return this.authService.login(loginDto);
  }

  @Get('/user/:id')
  findOne(@Param('id') id: string) {
    return this.authService.findOne(id);
  }

  @Get()
  findAll() {
    return this.authService.findAll();
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateSimpleUserDto: SignUpDto) {
    return this.authService.update(id, updateSimpleUserDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.authService.remove(id);
  }
}
