import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-comment"
export default class extends Controller {
  static targets = ["form", "comments"]

  connect() {
    console.log("connected");
  }

  display() {
    this.formTarget.classList.toggle("d-none")
    this.commentsTarget.classList.toggle("d-none")
  }
}
