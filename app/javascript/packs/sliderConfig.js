import { tns } from 'tiny-slider/src/tiny-slider';

//======= tiny slider for slider-active
const slider = tns({
  container: '.slider-active',
  items: 1,
  slideBy: 'page',
  autoplay: true,
  mouseDrag: true,
  gutter: 0,
  nav: true,
  controls: false,
  autoplayButtonOutput: false,
});
