import Flickity from 'flickity-fullscreen';

function initCarousel(targetClass) {
  const element = document.querySelector(`.${targetClass}`);
  if (!element) {
    return null;
  }

  console.log('here')

  const flkty = new Flickity(`.${targetClass}`, {
    autoPlay: 6000,
    cellSelector: '.carousel-cell',
    prevNextButtons: false,
    pageDots: true,
    cellAlign: 'center',
    resize: false,
    wrapAround: true,
    initialIndex: element.dataset.initial ? Number(element.dataset.initial) : 0,
    fullscreen: true
    // contain: true
  });
}

export default initCarousel;
