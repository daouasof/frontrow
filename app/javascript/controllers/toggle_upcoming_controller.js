import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-upcoming"
export default class extends Controller {
  static targets = ['card', 'link']

  connect() {
    console.log(this.cardTarget.parentElement)
    this.cardTargets.forEach((card) => {
      const date = new Date(card.dataset.date);
        if (date >= new Date()) {
          card.classList.toggle("hide")
          card.parentElement.classList.toggle("hide")
        }
    })
  }

  hide() {
    this.cardTargets.forEach((card) => {
      const date = new Date(card.dataset.date);
        if (date <= new Date()) {
          card.classList.toggle("hide")
          card.parentElement.classList.toggle("hide")
        } else {
          card.classList.toggle("hide")
          card.parentElement.classList.toggle("hide")
        }
    })
  }
}
