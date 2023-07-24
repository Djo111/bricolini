// app.controller.ts
import { Controller, Post, UploadedFile, UseInterceptors } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { IAService } from './ia.service';

@Controller()
export class IAController {
  constructor(private readonly iaService: IAService) {}

  @Post('/predict')
  @UseInterceptors(FileInterceptor('imageData')) // Assuming the image is sent as a file in the request
  async predict(@UploadedFile() imageData: Buffer): Promise<any> {
    try {
      // Perform prediction using the preprocessed data
      const predictionResult = await this.iaService.predict(imageData);

      return predictionResult;
    } catch (error) {
      return { error: error.message };
    }
  }
}
