import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["light", "dark"]

  connect() {
    if ((localStorage.getItem("theme") || "dark") == "light") this.light();
    else this.dark();
  }

  dark() {
    localStorage.setItem("theme", "dark");
    document.documentElement.setAttribute("data-theme", "dark");
    this.lightTarget.classList.add("mode-switch-hidden");
    this.darkTarget.classList.remove("mode-switch-hidden");
  }

  light() {
    localStorage.setItem("theme", "light");
    document.documentElement.setAttribute("data-theme", "light");
    this.lightTarget.classList.remove("mode-switch-hidden");
    this.darkTarget.classList.add("mode-switch-hidden");
  }
}
