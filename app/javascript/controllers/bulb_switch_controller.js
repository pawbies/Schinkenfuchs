import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["light", "dark"];

  connect() {
    this.updateIcons();
    window.addEventListener("themechange", this.updateIcons);
  }

  disconnect() {
    window.removeEventListener("themechange", this.updateIcons);
  }

  updateIcons = () => {
    const theme = (localStorage.getItem("theme") || "dark");
    if (theme === "light") {
      this.lightTargets.forEach(el => el.classList.remove("mode-switch-hidden"));
      this.darkTargets.forEach(el => el.classList.add("mode-switch-hidden"));
    } else {
      this.lightTargets.forEach(el => el.classList.add("mode-switch-hidden"));
      this.darkTargets.forEach(el => el.classList.remove("mode-switch-hidden"));
    }
  }

  dark() {
    localStorage.setItem("theme", "dark");
    document.documentElement.setAttribute("data-theme", "dark");
    this.updateIcons();
    window.dispatchEvent(new Event("themechange"));
  }

  light() {
    localStorage.setItem("theme", "light");
    document.documentElement.setAttribute("data-theme", "light");
    this.updateIcons();
    window.dispatchEvent(new Event("themechange"));
  }
}