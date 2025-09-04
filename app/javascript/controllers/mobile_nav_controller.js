import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["links", "burgerLine", "plaque"]

  toggle() {
    this.linksTarget.classList.toggle("mobile-hidden")
    this.plaqueTarget.classList.toggle("darkened")

    if (this.burgerLineTargets.length >= 3) {
      this.burgerLineTargets[0].classList.toggle("short")
      this.burgerLineTargets[2].classList.toggle("short")
    }
  }
}
