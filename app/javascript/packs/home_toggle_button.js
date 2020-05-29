const moveBall = () => {
  const ball = document.querySelector('.ball')
  const forArtists = document.querySelector('.sides.left')
  const forCollectors = document.querySelector('.sides.right')
  const artistTab = document.querySelector('.artist-tab')
  const collectorTab = document.querySelector('.collector-tab')
  ball.classList.toggle('active')
  forArtists.classList.toggle('active')
  forCollectors.classList.toggle('active')
  artistTab.classList.toggle('active')
  collectorTab.classList.toggle('active')
};
const toggleHomePageButton = () => {
  const toggler = document.querySelector('.toggle-button')
  if (toggler) {
    toggler.addEventListener('click', moveBall)
  }
}

export default toggleHomePageButton
