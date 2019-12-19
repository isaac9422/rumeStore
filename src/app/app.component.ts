import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Rume Store';
  toggleMenu: boolean = true;
  
  toggle(){
    this.toggleMenu = !this.toggleMenu;
  }
}
