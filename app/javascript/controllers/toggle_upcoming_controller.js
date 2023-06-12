import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-upcoming"
export default class extends Controller {
  static targets = ['card']

  connect() {
    // console.log("A string");
    this.date = new Date(this.cardTargets[20].dataset.date)
    // console.log(date)
    console.log("Card: ", this.cardTargets)
  }

  hide() {
    // need to iterate over this.cardTargets
    // conditional will be in that iteration
    // let this.date = new Date(this.card.dataset.date)

    if (this.date < new Date()) {

      // addClassList("d-none") to dates in past
    }
  }
}
