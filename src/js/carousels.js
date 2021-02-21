import "owl.carousel/dist/assets/owl.carousel.css";
import "owl.carousel";

$("#main").owlCarousel({
  loop: true,
  margin: 10,
  items: 1,
  nav: true,
  responsiveClass: true,
});

$(".carousel-slider").owlCarousel({
  loop: true,
  margin: 30,
  responsiveClass: true,
  responsive: {
    0: {
      items: 1,
      nav: true,
    },
    600: {
      items: 3,
      nav: false,
    },
    1000: {
      items: 4,
      nav: true,
      loop: false,
    },
  },
});

$(".carousel-recent").owlCarousel({
  items: 1,
  loop: true,
  mouseDrag: false,
  touchDrag: false,
  pullDrag: false,
  rewind: true,
  autoplay: true,
  margin: 0,
  nav: true,
  animateOut: "slideOutUp",
  animateIn: "slideInUp",
});
