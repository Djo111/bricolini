/* eslint-disable prettier/prettier */
import { Body, Controller, Delete, Get, Param, Patch, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { SignUpDto } from './dto/signup.dto';
import { LogInDto } from './dto/login.dto';
import { User } from './schemas/user.schema';

@Controller('auth')
export class AuthController {
    constructor(private authService: AuthService) { }
    
    @Post('/signup')
    SignUp(
        @Body()
        signupDto: SignUpDto
    ): Promise<string>{
        return this.authService.signUp(signupDto);
    }

    @Get('/login')
    Login(
        @Body()
        loginDto: LogInDto
    ): Promise<{ token: string }>{
        return this.authService.login(loginDto);
    }


    @Get()
    findAll() {
    return this.authService.findAll();
    }
    @Get('users/diy')
    async findAllDIYUsers(): Promise<User[]> {
      return this.authService.findAllDIY();
    }
  
    @Get('users/rc')
    async findAllRCUsers(): Promise<User[]> {
      return this.authService.findAllRC();
    }
  
    @Get('users/user')
    async findAllSimpleUsers(): Promise<User[]> {
      return this.authService.findAllU();
    }
  
    @Get('users/transporter')
    async findAllTUsers(): Promise<User[]> {
      return this.authService.findAllT();
    }
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.authService.findOne(id);
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
