import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["options"]

  /* Close when clicking anywhere else */
  /* (Ignore this, Mr. 19 years old)*/
  connect() {
    document.addEventListener("click", this.closeOnClickAway)
  }

  disconnect() {
    document.removeEventListener("click", this.closeOnClickAway)
  }

  closeOnClickAway = (event) => {
    if (!this.element.contains(event.target)) {
      this.optionsTarget.classList.add("hidden");
    }
  }

  /* needed fo Pagespeed insight, trust */
  update(event) {
    const url = event.target.value
    if (window.Turbo) {
      Turbo.visit(url)
    } else {
      window.location = url
    }
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
}