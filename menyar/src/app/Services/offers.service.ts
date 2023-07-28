import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {offer} from "../offers/offers.component";
@Injectable({

  providedIn: 'root'
})
export class OffersService {

  private apiUrl = 'http://localhost:3000/';
  constructor(private http: HttpClient) { }

  getUnverifiedOffers(): Observable<offer[]> {
    const url = `${this.apiUrl}offer/notVerifiedOffers`;
    return this.http.get<offer[]>(url);
  }

  acceptOfferById(offerId: string): Observable<offer> {
    const body = { status: '1' }; // The data to be sent in the request body
    return this.http.post<offer>(`${this.apiUrl}admin/offers/${offerId}/accept`, body);
  }
  declineOfferById(offerId: string): Observable<offer> {
    return this.http.delete<offer>(`${this.apiUrl}admin/offers/${offerId}`);
  }
}
