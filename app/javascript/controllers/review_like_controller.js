import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-like"
export default class extends Controller {
  static targets = ["likes"];
  static values = {count: Number, liked: Boolean};

  connect() {
    // console.log("connected");
    // console.log(this.likesTarget);
    // console.log(this.likedValue);
  }

  update(event) {
    // event.preventDefault();
    console.log("clicked");
    console.log(this.countValue);
  }

}
