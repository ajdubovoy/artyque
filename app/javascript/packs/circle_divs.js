import CircleType from 'circletype';

const initCircleDivs = () => {
  const circles = document.querySelectorAll('.circle')
  circles.forEach((circle) => {
    new CircleType(circle);
  });
  const bannerCircle = document.querySelector('.banner-circle')
  bannerCircle.style.transform = 'rotate(128deg)'

}

export default initCircleDivs
