import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["pwd", "signin", "text"];

  toggle() {
    this.pwdTarget.classList.toggle("pwd-hidden");
    this.signinTarget.classList.toggle("signin-stay");
    this.textTarget.classList.toggle("signin-stay");
  }

  back() {
    this.pwdTarget.classList.add("pwd-hidden");
    this.signinTarget.classList.add("signin-stay");
    this.textTarget.classList.add("signin-stay");
    this.signinTarget.classList.remove("signin-move");
    this.textTarget.classList.remove("signin-move");
  }
}
