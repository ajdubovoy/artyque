import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'button', 'fixed', 'panel', 'frame', 'nav' ]

  initialize() {
    this.fixedTarget.classList.toggle('col-sm-4');
    this.frameTarget.classList.toggle('d-none');
    this.frameTarget.classList.toggle('col-sm-8');
    this.navTarget.classList.toggle('col-sm-3');
    this.panelTarget.classList.toggle('col-sm-9');
    this.buttonTarget.classList.toggle('button-primary');
    this.buttonTarget.classList.toggle('button-tertiary');
  }

  toggle(event) {
    event.preventDefault(); 
    this.fixedTarget.classList.toggle('col-sm-4');
    this.frameTarget.classList.toggle('d-none');
    this.frameTarget.classList.toggle('col-sm-8');
    this.navTarget.classList.toggle('col-sm-3');
    this.panelTarget.classList.toggle('col-sm-9');
    console.log('here')
    this.buttonTarget.classList.toggle('button-primary');
    this.buttonTarget.classList.toggle('button-tertiary');
  }
}
