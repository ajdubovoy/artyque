import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source", "button" ]

  initialize() {
  }

  update(event) {
    const button = event.target.closest('.stim-select-button');
    this.buttonTargets.forEach((buttonTarget) => {
      buttonTarget.classList.remove('selected');
    });    
    button.classList.add('selected');
  }
}
