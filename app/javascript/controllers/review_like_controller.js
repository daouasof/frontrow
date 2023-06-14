import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-like"
export default class extends Controller {
  static targets = ["likes", "icon"];
  static values = {count: Number, liked: Boolean};

  connect() {
    // console.log("connected");
     console.log(this.likesTarget);
    // console.log(this.likedValue);
    if (this.countValue === 0) {
      this.likesTarget.classList.add("d-none");
    }
  }

  // changeicon() {

  // }

  like(event) {
    event.preventDefault();
    const url = this.iconTarget.href;
    // const url = event.currentTarget.href;
    console.log(url);
    // fetch(url)
    fetch(url, {
      headers: {"Accept": "application/json"},
    })
    .then(response=>response.json())
    .then((data)=> {
      console.log(data);
      // event.target.outerHTML = data.icon;
      this.iconTarget.outerHTML = data.icon;
      this.likesTarget.innerHTML = data.count;
      if (data.count === 0) {
        this.likesTarget.classList.add("d-none");
      } else {
        this.likesTarget.classList.remove("d-none");
      }
    })
  }


}
