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
    cellAlign: 'center',
    resize: true,
    // contain: true
  });
}

export default initBannerCarousel;
