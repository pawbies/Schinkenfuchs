import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["light", "dark"]

  connect() {
    document.documentElement.setAttribute("data-theme", "dark");
  }

  dark() {
    document.documentElement.setAttribute("data-theme", "dark");
    this.lightTarget.classList.add("mode-switch-hidden");
    this.darkTarget.classList.remove("mode-switch-hidden");
  }

  light() {
    document.documentElement.setAttribute("data-theme", "light");
    this.lightTarget.classList.remove("mode-switch-hidden");
    this.darkTarget.classList.add("mode-switch-hidden");
  }
}
