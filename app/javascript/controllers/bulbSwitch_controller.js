import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  swap(event) {
    const bulb = event.currentTarget
    const dmbulb = bulb.dataset.dmbulb
    const lmbulb = bulb.dataset.lmbulb

    bulb.src = (bulb.src.endsWith(dmbulb) || bulb.src.includes(dmbulb)) ? lmbulb : dmbulb
  }
}
