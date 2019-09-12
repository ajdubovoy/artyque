import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'logo', 'header' ]

  connect = () => {
    if (this.isInHiddenMode()) {
      this.addHideClass();
    }
  }

  isInHiddenMode = () => {
    return this.data.get('hidden') === 'true';
  }

  addHideClass = () => {
    this.logoTarget.classList.add('transparent');
  }

  removeHideClass = () => {
    this.logoTarget.classList.remove('transparent');
  }

  showLogo = (event) => {
    if (this.isInHiddenMode()) {
      if (window.scrollY >= this.headerTarget.clientHeight) {
        this.removeHideClass();
      } else {
        this.addHideClass();
      }
    }
  }
}
