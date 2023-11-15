import { Component } from '@angular/core';
import { AuthService } from "@test-pronto-scaffold-logic/common/common-services";

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

  constructor(private authService: AuthService) {
  }

  logIn() {
    this.authService.loginWithRedirect()
  }

  signUp() {
    this.authService.signUpWithRedirect();
  }
}
