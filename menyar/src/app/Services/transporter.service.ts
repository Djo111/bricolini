import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";
import {User} from "../transporter/transporter.component";

@Injectable({
  providedIn: 'root'
})

export class TransporterService {

     private apiUrl='http://localhost:3000/admin';
  constructor( private http :HttpClient) {
  }
  getAllUsersByCategory(category: string): Observable<User[]> {
      const url = `${this.apiUrl}/users/${category}`;
      return this.http.get<User[]>(url);
    }

}
