import {Component, OnInit} from '@angular/core';
import {TransporterService} from "../Services/transporter.service";
export interface User {
  _id: string;
  username: string;
  email: string;
  password: string;
  category: string;
  phoneNumber: number;
  address: string;
  diy_waste_type: string;
  createdAt: Date;
  updatedAt: Date;
  __v: number;
}


@Component({
  selector: 'app-transporter',
  templateUrl: './transporter.component.html',
  styleUrls: ['./transporter.component.css']
})

export class TransporterComponent implements OnInit{
  users: User[] = [];

  constructor( private transporterService:TransporterService){}
  ngOnInit() {
    const category = 'Transporter'; // Remplacez cette valeur par la catégorie que vous souhaitez récupérer

    this.transporterService.getAllUsersByCategory(category).subscribe(
      (data: User[]) => {
        this.users = data;

        console.log('Utilisateurs récupérés :', this.users);
      },
      (error) => {
        console.error('Erreur lors de la récupération des utilisateurs :', error);
      }
    );
  }


}

