import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="language-selection"
export default class extends Controller {
  connect() {
  }
  
  update(evt) {
    const url = evt.target.value;
    if (window.Turbo) { Turbo.visit(url) } else { window.location = url }
  }
}
