import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "light", "dark" ];

  dark() {
    this.lightTarget.classList.add("mode-switch-hidden");
    this.darkTarget.classList.remove("mode-switch-hidden");
  }

  light() {
    this.lightTarget.classList.remove("mode-switch-hidden");
    this.darkTarget.classList.add("mode-switch-hidden");
  }
}
