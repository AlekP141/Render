import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="booking-form"
export default class extends Controller {


  static targets = ["bookingFormDiv", "form", "numberOfNights", "serviceCharge", "totalPrice", "pricePerNight", "startDate", "endDate"]
  connect() {
    console.log("working")
  }

  show_booking_form() {
    this.bookingFormDivTarget.classList.toggle("d-none");
  }

  submit(e) {
    e.preventDefault()
    // console.log(this.formTarget)
    // console.dir(this.formTarget)

    let start_date = this.formTarget[0].value
    let end_date = this.formTarget[1].value

    // console.log(start_date)
    // console.log(end_date)

    const date_diff = start_date - end_date
    // console.log(date_diff)

    const date1 = new Date(start_date);
    const date2 = new Date(end_date);
    const diffTime = Math.abs(date2 - date1);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    // console.log(diffDays + " days");

    this.numberOfNightsTarget.innerText = diffDays
    console.log(this.pricePerNightTarget)
    const totalPrice = diffDays * parseInt(this.pricePerNightTarget.innerText, 10)
    const serviceCharge = totalPrice * 0.10
    this.serviceChargeTarget.innerText = serviceCharge
    this.totalPriceTarget.innerText = totalPrice + serviceCharge

    this.startDateTarget.value = start_date
    this.endDateTarget.value = end_date
    console.log(this.startDateTarget.value)
    console.log(this.endDateTarget.value)
  }
}
