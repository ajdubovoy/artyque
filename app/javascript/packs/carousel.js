import Flickity from 'flickity';

function initCarousel(targetClass) {
  const element = document.querySelector(`.${targetClass}`);
  if (!element) {
    return null;
  }

  const flkty = new Flickity(`.${targetClass}`, {
    autoPlay: 6000,
    cellSelector: '.carousel-cell',
    prevNextButtons: false,
    pageDots: true,
    cellAlign: 'center',
    resize: false,
    // contain: true
  });
}

export default initCarousel;
