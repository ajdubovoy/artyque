import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'fixed', 'panel', 'frame', 'nav' ]

  toggle(event) {
    event.preventDefault(); 
    this.fixedTarget.classList.toggle('col-sm-4');
    this.frameTarget.classList.toggle('d-none');
    this.frameTarget.classList.toggle('col-sm-8');
    this.navTarget.classList.toggle('col-sm-3');
    this.panelTarget.classList.toggle('col-sm-9');
  }
}
