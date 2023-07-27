import { Injectable } from '@nestjs/common';
import { Stripe } from 'stripe';

@Injectable()
export class StripeService {
  private stripe: Stripe;

  constructor() {
    this.stripe = new Stripe('<your_secret_key>', { apiVersion: '2022-11-15' });
  }

  async createPaymentIntent(amount: number, currency: string): Promise<string> {
    const paymentIntent = await this.stripe.paymentIntents.create({
      amount,
      currency,
    });

    return paymentIntent.client_secret;
  }

  handleStripeWebhook(stripeEvent): void {
    switch (stripeEvent.type) {
      case 'payment_intent.succeeded':
        // Handle payment success
        console.log('Payment succeeded');
        break;
      case 'payment_intent.payment_failed':
        // Handle payment failure
        console.log('Payment failed');
        break;
      // ... handle other event types
    }
  }
}
