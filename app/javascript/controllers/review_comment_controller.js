import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-comment"
export default class extends Controller {

  static values = { reviewId: Number};

  connect() {
    console.log("connected");
  }

  display() {
    console.log("clicked");
    console.log(this.reviewIdValue);
  }
}
