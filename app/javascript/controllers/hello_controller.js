/**
 * Visit The Stimulus Handbook for more details
 *   1) https://stimulusjs.org/handbook/introduction
 *   2) https://stimulus.hotwired.dev/
 */

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "name", "output" ]

  greet() {
    this.outputTarget.textContent =
      `Hello, ${this.nameTarget.value}!`
  }
}