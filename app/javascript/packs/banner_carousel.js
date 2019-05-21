import Flickity from 'flickity';
import 'flickity/dist/flickity.min.css';

var flkty = new Flickity('.banner-carousel', {
  autoPlay: 5000,
  cellSelector: '.banner-carousel-cell',
  prevNextButtons: false,
  pageDots: true,
  cellAlign: 'center',
  resize: true,
  contain: true
});
