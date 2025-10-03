import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["elem"];

  connect() {
    const urlParams = new URLSearchParams(window.location.search);
    const from = urlParams.get("from");

    requestAnimationFrame(() => {
      this.element.classList.remove("auth-no-transitions");
      requestAnimationFrame(() => {
        if (from === "forgot") {
          const first = this.elemTargets[0];
          const last = this.elemTargets[this.elemTargets.length - 1];
          if (first) first.classList.add("show");
          this.animate([last]);
        } else {
          this.animate(this.elemTargets);
        }
      });
    });
  }

  animate(elems) {
    elems.forEach((el, i) => {
      setTimeout(() => el.classList.add("show"), i * 150);
    });
  }
}
