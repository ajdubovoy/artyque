import "bootstrap";
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import initNavbar from "./navbar";
import initBannerCarousel from "./banner_carousel";
import initTriggerSave from "./trigger_save";
import 'flickity/dist/flickity.min.css';
import initCarousel from './carousel';
import initArtistCarousel from './artist_carousel';
import initSortable from './form_sorting';

function init() {
  // Stimulus.JS
  const application = Application.start()
  const context = require.context("./controllers", true, /\.js$/)
  application.load(definitionsFromContext(context))

  initNavbar();
  initBannerCarousel('banner-carousel');
  initCarousel('carousel');
  initArtistCarousel('artist-carousel');
  initSortable();
}

init();

global.init = init;
global.initCarousel = initCarousel;
// Exposes the init function as a global variable so that you can call window.init() out of any vanilla JavaScript file, particular .js.erb templates, and access the Webpacked initialization function.
