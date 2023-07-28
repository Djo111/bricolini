import {Component, OnInit} from '@angular/core';
import {OffersService} from "../Services/offers.service";
import {User} from "../transporter/transporter.component";

export interface offer {
  _id: string;
  image: string;
  location:string;
  status: 0 | 1;
}
@Component({
  selector: 'app-offers',
  templateUrl: './offers.component.html',
  styleUrls: ['./offers.component.css']
})
export class OffersComponent  implements OnInit{
  offers: offer[] = [];
  displayedColumns: string[] = ['id', 'image', 'location','Actions'];
  private unverifiedOffers: any;
  constructor( private OffersService:OffersService ){}
  ngOnInit(): void {

    this.OffersService.getUnverifiedOffers().subscribe(
      (data: offer[]) => {
        this.offers = data;
console.log(this.offers)
        console.log('Utilisateurs récupérés :', this.offers);
      },
      (error) => {
        console.error('Erreur lors de la récupération des utilisateurs :', error);
      }
    );

  }

    acceptOffer(offerId: string): void {
      this.OffersService.acceptOfferById(offerId).subscribe((offer) => {
        console.log('Offer accepted:', offer);
        // After accepting the offer, you may update the local list of unverifiedOffers or perform any other actions.
      });
    }

  declineOffer(offerId: string , offer: any): void {
    this.OffersService.declineOfferById(offerId).subscribe(
      (response) => {
        // Handle the successful decline of the offer
        console.log('Offer declined:', response);
        offer.isDeclined = true; // Update the offer status locally
      },
      (error) => {
        console.error('Error declining offer:', error);
      }
    );
  }
}

