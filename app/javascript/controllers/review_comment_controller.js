import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-comment"
export default class extends Controller {
  static targets = ["form", "comments"];

  connect() {
    console.log("connected");
  }

  display() {
    this.formTarget.classList.toggle("d-none");
    this.commentsTarget.classList.toggle("d-none");
  }

  create(event) {
    event.preventDefault();
    const url = this.formTarget.action;
    fetch(url, {
      method: "POST",
      headers: {"Accept": "text/plain"},
      body: new FormData(this.formTarget)
    })
    .then(response => response.text())

    .then((data) => {
      this.commentsTarget.insertAdjacentHTML("afterbegin", data);
    })
  }
}
