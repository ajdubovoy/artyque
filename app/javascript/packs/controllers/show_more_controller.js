import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content", 'button' ]

  initialize() {
    this.hide();
  }

  hide() {
    this.contentTarget.style.maxHeight = this.contentTarget.dataset.heightLimit; 
    this.contentTarget.dataset.open = false;
  }

  show() {
    this.contentTarget.style.maxHeight = '100%';
    this.contentTarget.dataset.open = true;
    this.buttonTarget.style.opacity = 0;
  }

  toggle(event) {
    event.preventDefault();
    if (this.contentTarget.dataset.open == 'true') {
      this.hide();
    } else {
      this.show();
    }
  }
}
