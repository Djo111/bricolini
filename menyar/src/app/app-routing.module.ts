import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { TransporterComponent } from './transporter/transporter.component';
import { WorkshopsComponent } from './workshops/workshops.component';
import { OffersComponent } from './offers/offers.component';
import { CentersComponent } from './centers/centers.component';
import { HistoryComponent } from './history/history.component';
import { TestComponent } from './test/test.component';

const routes: Routes = [
  {path:'', component : LoginComponent},
  {path:'home',component : HomeComponent},
  {path:'home/transporter',component : TransporterComponent},
  {path:'home/workshops',component: WorkshopsComponent},
  {path:'home/offers',component:OffersComponent},
  {path:'home/users',component:WorkshopsComponent},
  {path:'home/centers',component:CentersComponent},
  {path:'home/history',component:HistoryComponent},
   {path:'test',component:TestComponent}

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
