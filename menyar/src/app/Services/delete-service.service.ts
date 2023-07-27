import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { catchError, Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class DeleteServiceService {

  private apiUrl = 'http://localhost:3000/auth';

  constructor(private http: HttpClient) { }

  deleteUser(userId: string): Observable<any> {
    return this.http.delete(`${this.apiUrl}/${userId}`).pipe(
      catchError((error) => {
        console.error(`Error deleting user with ID ${userId}:`, error);
        throw error;
      })
    );
  }
}
