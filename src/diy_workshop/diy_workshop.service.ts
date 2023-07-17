import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';

import * as mongoose from 'mongoose';
import { AuthService } from 'src/auth/auth.service';

@Injectable()
export class DiyWorkshopService {
    constructor(
        
        private authservice: AuthService
    ) { }



}