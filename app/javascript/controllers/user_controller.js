import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "button", "password" ]

  toggle() {
    this.passwordTarget.disabled = !this.passwordTarget.disabled
  }
}