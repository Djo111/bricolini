// app.module.ts
import { Module } from '@nestjs/common';
import { IAController } from './ia.controller';
import { IAService } from './ia.service';

@Module({
  imports: [],
  controllers: [IAController],
  providers: [IAService],
})
export class IAModule {}