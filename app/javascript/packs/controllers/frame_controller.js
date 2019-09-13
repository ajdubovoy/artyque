import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'button', 'fixed', 'panel', 'frame', 'nav' ]

  connect() {
    this.buttonTarget.addEventListener('click', this.toggle);
    this.toggleFrame();
  }

  disconnect() {
    this.buttonTarget.removeEventListener('click', this.toggle);
  }

  toggleFrame() {
    this.fixedTarget.classList.toggle('col-sm-4');
    this.frameTarget.classList.toggle('d-sm-none');
    this.frameTarget.classList.toggle('d-sm-block');
    this.frameTarget.classList.toggle('col-sm-8');
    this.navTarget.classList.toggle('col-sm-3');
    this.panelTarget.classList.toggle('col-sm-9');
    this.buttonTarget.classList.toggle('button-primary');
    this.buttonTarget.classList.toggle('button-tertiary');
  }

  toggle = (event) => {
    event.preventDefault(); 
    this.toggleFrame();
  }
}
