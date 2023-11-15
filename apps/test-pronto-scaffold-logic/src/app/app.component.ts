import { Component } from '@angular/core';

@Component({
  selector: 'test-pronto-scaffold-logic-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  sideNavOpen = false;
  title = 'test-pronto-scaffold-logic';

  sideNavToggle(): void {
    this.sideNavOpen = !this.sideNavOpen;
  }
}
