import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-comment"
export default class extends Controller {
  static targets = ["form", "comments"];

  connect() {
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
      headers: {"Accept": "application/json"},
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.comment) {
          this.commentsTarget.insertAdjacentHTML("afterbegin", data.comment);
        }
        this.formTarget.outerHTML = data.form;
        this.formTarget.classList.remove("d-none");
      })
  }
}
