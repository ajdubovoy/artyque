import CircleType from 'circletype';

const initCircleDivs = () => {
  const circles = document.querySelectorAll('.circle')
  if (circles.length > 0) {
    circles.forEach((circle) => {
      new CircleType(circle).radius(123 / 2);
    });
    const bannerCircle = document.querySelector('.banner-circle')
    bannerCircle.style.transform = 'rotate(128deg)'
  }
}

export default initCircleDivs
