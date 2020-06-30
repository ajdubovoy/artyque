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
  const toggler = document.querySelector('#toggle-state')
  toggler.style.display = 'none';
  if (toggler) {
    toggler.addEventListener('change', moveBall)
  }
}

export default toggleHomePageButton
