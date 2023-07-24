// app.service.ts
import { Injectable } from '@nestjs/common';
import * as tf from '@tensorflow/tfjs-node';
import sharp from 'sharp';

@Injectable()
export class IAService {
  private model: tf.LayersModel;

  constructor() {
    // Load your trained CNN model (Assuming it's already trained and saved)
    this.loadModel();
  }

  async loadModel(): Promise<void> {
    try {
      this.model = await tf.loadLayersModel('./cnn_model.json');
    } catch (error) {
      throw Error('Failed to load the model.');
    }
  }

  async preprocessImage(imageData: Buffer): Promise<number[][][]> {
    try {
      // Use sharp to resize and convert the image to (224, 224) and extract RGB values
      const resizedImageData = await sharp(imageData)
        .resize(224, 224)
        .toBuffer();

      // Decode the resized image data and normalize pixel values
      const preprocessedImageData = tf.tidy(() => {
        const imageTensor = tf.node.decodeImage(resizedImageData);
        const normalizedImage = imageTensor.div(255); // Rescale pixel values to [0, 1]
        return normalizedImage;
      });

      return preprocessedImageData.arraySync() as number[][][];
    } catch (error) {
      throw new Error('Failed to preprocess the image.');
    }
  }

  async predict(inputData: Buffer): Promise<any> {
    try {
      // Preprocess the input image
      const preprocessedImageData = await this.preprocessImage(inputData);

      // Perform inference using the preprocessed data
      const inputTensor = tf.tensor(preprocessedImageData);
      const prediction = this.model.predict(inputTensor) as tf.Tensor;

      return {
        classProbabilities: prediction.arraySync()[0],
        predictedClass: prediction.argMax(1).dataSync()[0],
      };
    } catch (error) {
      throw new Error('Failed to process the request.');
    }
  }
}
