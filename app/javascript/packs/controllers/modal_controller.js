import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal", "content", "backdrop" ]

  initialize() {
    this.modalTarget.classList.add('d-none');
    this.backdropTarget.classList.add('d-none');
    this.contentTarget.innerHTML = '';
  }

  closeModal() {
    this.modalTarget.classList.add('d-none');
    this.backdropTarget.classList.add('d-none');
    this.contentTarget.innerHTML = '';
    const top = document.body.style.top;
    const scrollStyle = document.querySelector('html').style.scrollBehavior;
    document.querySelector('html').style.scrollBehavior = 'auto'; // Prevent smooth scrolling
    document.body.style.position = '';
    document.body.style.top = '';
    window.scrollTo(0, parseInt(top || '0') * -1);
    document.querySelector('html').style.scrollBehavior = scrollStyle; // Reenable smooth scrolling if enabled
  }

  openModal() {
    const top = window.scrollY;
    this.modalTarget.classList.remove('d-none');
    this.backdropTarget.classList.remove('d-none');
    document.body.style.position = 'fixed';
    document.body.style.top = `-${top}px`;
  }

  update(event) {
    event.preventDefault();
    this.openModal();
  }

  hide(event) {
    event.preventDefault();
    this.closeModal();
  }
}
