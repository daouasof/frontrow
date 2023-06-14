import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-like"
export default class extends Controller {
  connect() {
    console.log("connected");
  }

  update(event) {
    event.preventDefault();
    console.log("clicked");
  }

}
