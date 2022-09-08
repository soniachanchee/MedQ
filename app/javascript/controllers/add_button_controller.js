import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-button"
export default class extends Controller {
  static targets = ["quantity"]

  connect() {
    console.log("Works again")
  }
  add_quantity() {
    console.log(this.quantityTarget.innerHTML)
    let quantity = parseInt(this.quantityTarget.innerHTML, 10);
    console.log(quantity)
    quantity += 1
    console.log(quantity)
    // if (quantity > stock.quantity)
    this.quantityTarget.innerHTML = quantity
    // unless quantity > stock.quantity;

  }

  remove_quantity() {
    let quantity = parseInt(this.quantityTarget.innerHTML, 10);
    console.log(quantity)
    quantity -= 1
    console.log(quantity)
    this.quantityTarget.innerHTML = quantity
  }
}
