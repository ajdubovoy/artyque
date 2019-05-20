function initNavbar() {
  const openButton = document.getElementById("navbar-open-button");
  const closeButton = document.getElementById("navbar-close-button");
  const close = document.getElementById("navbar-close");
  const menu = document.getElementById("navbar-menu");
  const body = document.querySelector("body");
  const html = document.querySelector("html");

  openButton.addEventListener("click", (event) => {
    close.classList.remove("hidden");
    menu.classList.remove("hidden");
    close.classList.add("slide-in");
    menu.classList.add("slide-in");
    openButton.classList.add("hidden");
    body.classList.add("scroll-disable");
    html.classList.add("scroll-disable");
  });

  closeButton.addEventListener("click", (event) => {
    close.classList.add("hidden");
    menu.classList.add("hidden");
    openButton.classList.remove("hidden");
    body.classList.remove("scroll-disable");
    html.classList.remove("scroll-disable");
  });
}

export default initNavbar;
