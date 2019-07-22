import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "embed" ]

  validationExpression = /https?:\/\/vimeo\.com\/(?<id>\d+)/

  initialize() {
    this.renderEmbed();
  }

  update(event) {
    this.renderEmbed();
  }
 
  renderEmbed() {
    const input = this.inputTarget.value;
    if (this.validationExpression.test(input)) {
      const videoID = input.match(this.validationExpression).groups.id;
      this.embedTarget.innerHTML = `<iframe src="https://player.vimeo.com/video/${videoID}?title=0&byline=0&portrait=0" width="100%" height="300px" frameborder="0" allow="autoplay; fullscreen" allowfullscreen></iframe>`
    } else if (input) {
      this.embedTarget.innerHTML = '<em class="c-light-gray">The video could not be found on Vimeo.</em>'
    } else {
      this.embedTarget.innerHTML = ''
    }
  }
}
