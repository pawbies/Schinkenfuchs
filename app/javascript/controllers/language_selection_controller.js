import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["options"]

  connect() {
    document.addEventListener("click", this.closeOnClickAway)
  }

  disconnect() {
    document.removeEventListener("click", this.closeOnClickAway)
  }

  toggle(event) {
    event.stopPropagation();
    this.optionsTarget.classList.toggle("hidden");
  }

  select(event) {
    const url = event.target.dataset.value;
    this.optionsTarget.classList.add("hidden");
    if (window.Turbo) { Turbo.visit(url) } else { window.location = url }
  }

  closeOnClickAway = (event) => {
    if (!this.element.contains(event.target)) {
      this.optionsTarget.classList.add("hidden");
    }
  }
}