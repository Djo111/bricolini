import { Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { User } from './schemas/user.schema';
import * as bcrypt from 'bcryptjs'
import { JwtService } from '@nestjs/jwt';
import { SignUpDto } from './dto/signup.dto';
import { LogInDto } from './dto/login.dto';

@Injectable()
export class AuthService {
    constructor(
        @InjectModel(User.name)
        private userModel: Model<User>,
        private jwtService: JwtService
     ) {}

    
    async signUp(signupDto: SignUpDto): Promise<{token: string}> {
        const { username, email, password } = signupDto
        const hashedPassword = await bcrypt.hash(password, 10)

        const user = await this.userModel.create({
            username,
            email,
            password: hashedPassword
        })

        const token = this.jwtService.sign({ id: user._id })
        
        return { token };
    }

    async login(logindto: LogInDto): Promise<{ token: string }>{
        const { email, password } = logindto
        const user = await this.userModel.findOne({ email })
        
        if (!user) {
            throw new UnauthorizedException("Invalid email!")
        }
        const isPasswordMatched = await bcrypt.compare(password, user.password)
         if (!isPasswordMatched) {
            throw new UnauthorizedException("Invalid email or password!")
         }
        
        const token = this.jwtService.sign({ id: user._id })
        
        return { token };
    }
    async validate(payload:any) {
        return{'User':payload.user};
    }

}
