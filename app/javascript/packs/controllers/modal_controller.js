import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "modal", "container", "content", "backdrop", "link" ]

  initialize() {
    this.modalTarget.classList.add('d-none');
    this.backdropTarget.classList.add('d-none');
    this.contentTarget.innerHTML = '';
    this.modalTarget.dataset.open = false;
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
    this.modalTarget.dataset.open = false;
  }

  openModal() {
    const top = window.scrollY;
    this.modalTarget.classList.remove('d-none');
    this.backdropTarget.classList.remove('d-none');
    if (this.modalTarget.dataset.open == 'true'){
      this.containerTarget.scrollTop = 0;
    } else {
      document.body.style.position = 'fixed';
      document.body.style.top = `-${top}px`;
    }
    this.modalTarget.dataset.open = true;
  }

  openWithoutUpdate(event) {
    event.preventDefault();
    this.openModal();
  }

  openAndUpdate(event) {
    const [data, status, xhr] = event.detail;
    const parsedResponse = JSON.parse(xhr.response);
    this.contentTarget.innerHTML = parsedResponse.html;
    this.openModal();

    const imgs = document.images;
    const len = imgs.length;
    let counter = 0;

    [].forEach.call(imgs, img => {
      if (img.complete) {
        incrementCounter();
      } else {
        img.addEventListener('load', incrementCounter, false);
      }
    });

    function incrementCounter() {
      counter += 1;
      if ( counter === len ) {
        initCarousel('carousel'); // USED SPECIFICALLY IN THIS APP TO REINITIALIZE CAROUSELS (exported as a global constant in application)
      }
    }
  }

  openAndError(event) {
    this.contentTarget.innerHTML = "We're very sorry, but we're having trouble processing your request...";
    this.openModal();
  }

  hide(event) {
    event.preventDefault();
    this.closeModal();
  }
}
