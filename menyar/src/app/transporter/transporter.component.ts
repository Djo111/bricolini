import {Component, OnInit, ViewChild} from '@angular/core';
import {TransporterService} from "../Services/transporter.service";
import {MatPaginator} from "@angular/material/paginator";
import {DeleteServiceService} from "../Services/delete-service.service";
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
  clickedRows = new Set<User>();
  @ViewChild(MatPaginator) paginator!: MatPaginator;

  displayedColumns: string[] = ['id', 'name', 'email', 'phoneNumber','region','number_of_small_trucks','number_of_medium_trucks',
    'number_of_big_trucks','Actions'];
  constructor( private transporterService:TransporterService,private DeleteServiceService:DeleteServiceService){}
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
  onEdit(user: any) {
    // Implémentez le comportement souhaité lors du clic sur le bouton "Edit".
    // Vous pouvez utiliser les données de l'utilisateur (user) pour effectuer une action.
    console.log('Edit clicked for user:', user);
  }

  delete(userId: string) {
    console.log('Delete button clicked for user ID:', userId);
    // Delete user from the backend (MongoDB)
    this.DeleteServiceService.deleteUser(userId).subscribe(() => {
      // If the backend deletion is successful, remove the user from the table
      const index = this.users.findIndex((user) => user._id === userId);
      if (index !== -1) {
        this.users.splice(index, 1);
        //this.users._updateChangeSubscription();
      }
    });
  }
}

