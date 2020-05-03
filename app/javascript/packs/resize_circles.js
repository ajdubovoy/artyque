const resizeCircles = () => {
  const resize = (e) => {
    const navBar = document.querySelector('.new-look-banner')
    const topCircle = document.querySelector('.top-right-circle')
    if (topCircle) {
      const containerWidth = navBar.offsetWidth
      const containerHeight = navBar.offsetHeight
      const top = (containerWidth / - 2.63)
      topCircle.style.top = `${top}px`

      const botCircle = document.querySelector('.bot-left-circle')
      // const topTwo = ((containerHeight / 2.63))
      // botCircle.style.top = `${topTwo}px`
    }
  }
  window.addEventListener('resize', resize)
}
export default resizeCircles;
