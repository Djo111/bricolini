import { Body, Controller, Get, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { SignUpDto } from './dto/signup.dto';
import { LogInDto } from './dto/login.dto';

@Controller('auth')
export class AuthController {
    constructor(private authService: AuthService) { }
    
    @Post('/signup')
    SignUp(
        @Body()
        signupDto: SignUpDto
    ): Promise<{ token: string }>{
        return this.authService.signUp(signupDto);
    }

    @Get('/login')
    Login(
        @Body()
        loginDto: LogInDto
    ): Promise<{ token: string }>{
        return this.authService.login(loginDto);
    }

}
