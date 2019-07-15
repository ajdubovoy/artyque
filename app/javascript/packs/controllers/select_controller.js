import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "button" ]

  initialize() {
    this.buttonTargets.forEach((buttonTarget) => {
      const input = this.inputTargets[0];
      if (buttonTarget.dataset.selectValue === input.value) {
        buttonTarget.classList.add('selected');
      }
    });
  }

  update(event) {
    const button = event.target.closest('.stim-select-button');
    this.buttonTargets.forEach((buttonTarget) => {
      buttonTarget.classList.remove('selected');
    });    
    button.classList.add('selected');
    const input = this.inputTargets[0];
    input.value = button.dataset.selectValue;
  }
}
