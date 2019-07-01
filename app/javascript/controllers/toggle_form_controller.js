import { Controller } from "stimulus"

export default class extends  Controller {
  static targets = ["form", "body"]

  toggle() {
    this.bodyTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
}
