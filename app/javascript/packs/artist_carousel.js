import Flickity from 'flickity';

function initArtistCarousel(targetClass) {
  const element = document.querySelector(`.${targetClass}`);
  if (!element) {
    return null;
  }

  const flkty = new Flickity(`.${targetClass}`, {
    autoPlay: 6000,
    cellSelector: '.artist-carousel-cell',
    prevNextButtons: false,
    pageDots: true,
    percentPosition: false,
    resize: false,
    wrapAround: true
    // contain: true
  });
}

export default initArtistCarousel;
