import "bootstrap";
import initNavbar from "./navbar";
import initBannerCarousel from "./banner_carousel";
import 'flickity/dist/flickity.min.css';
import initCarousel from './carousel';
import initSortable from './form_sorting';

function init() {
  initNavbar();
  initBannerCarousel('banner-carousel');
  initCarousel('carousel');
  initSortable();
}

init();

global.init = init;
// Exposes the init function as a global variable so that you can call window.init() out of any vanilla JavaScript file, particular .js.erb templates, and access the Webpacked initialization function.
