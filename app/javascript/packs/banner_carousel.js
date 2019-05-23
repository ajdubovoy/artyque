import Flickity from 'flickity';

function initBannerCarousel(targetClass) {
  const element = document.querySelector(`.${targetClass}`);
  if (!element) {
    return null;
  }

  const flkty = new Flickity(`.${targetClass}`, {
    autoPlay: 5000,
    cellSelector: '.banner-carousel-cell',
    prevNextButtons: false,
    pageDots: true,
    percentPosition: false,
    cellAlign: 'center',
    resize: false,
    // contain: true
  });
}

export default initBannerCarousel;
