import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal", "content" ]

  initialize() {
    this.closeModal();
  }

  closeModal() {
    this.modalTarget.classList.add('d-none');
    this.contentTarget.innerHTML = '';
  }

  openModal() {
    this.modalTarget.classList.remove('d-none');
  }

  update(event) {
    event.preventDefault();
    this.openModal();
  }
}
