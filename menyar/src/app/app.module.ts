import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { TransporterComponent } from './transporter/transporter.component';
import { CentersComponent } from './centers/centers.component';
import { WorkshopsComponent } from './workshops/workshops.component';
import { OffersComponent } from './offers/offers.component';
import { HistoryComponent } from './history/history.component';
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { TestComponent } from './test/test.component';
@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    HomeComponent,
    SidebarComponent,
    TransporterComponent,
    CentersComponent,
    WorkshopsComponent,
    OffersComponent,
    HistoryComponent,
    TestComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }