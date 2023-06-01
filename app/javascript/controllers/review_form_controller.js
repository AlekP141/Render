import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-form"
export default class extends Controller {
  static targets = ["show"]
  connect() {
    console.log("working")
  }

  show_review_form() {
    this.showTarget.classList.toggle("d-none");
  }
  submit(e) {
    e.preventDefault()
  }

}
