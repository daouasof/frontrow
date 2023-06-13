import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-upcoming"
export default class extends Controller {
  static targets = ['card']

  connect() {

  }

  hide() {
    this.cardTargets.forEach((card) => {
      const date = new Date(card.dataset.date);
        if (date <= new Date()) {
          card.classList.toggle("d-none")
        }
    })
  }
}
