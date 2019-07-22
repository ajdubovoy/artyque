import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "embed" ]

  validationExpression = /^https?:\/\/((www\.)?vimeo\.com\/|(www\.)?youtu\.be\/|(www\.)?youtube\.com\/watch\?v=)(?<id>.+)$/
  vimeoExpression = /^https?:\/\/(www\.)?vimeo\.com\/(?<id>.+)$/

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
      if (this.vimeoExpression.test(input)) {
        this.embedTarget.innerHTML = `<iframe class="embed-responsive-item" src="https://player.vimeo.com/video/${videoID}"></iframe>`
        this.embedTarget.classList.add('video-embed-active');
        this.embedTarget.classList.remove('video-embed-error');
      } else {
        this.embedTarget.innerHTML = `<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/${videoID}"></iframe>`
        this.embedTarget.classList.add('video-embed-active');
        this.embedTarget.classList.remove('video-embed-error');
      }
    } else if (input) {
      this.embedTarget.innerHTML = '<em class="c-light-gray">The video could not be found on Vimeo or YouTube.</em>'
      this.embedTarget.classList.remove('video-embed-active');
      this.embedTarget.classList.add('video-embed-error');
    } else {
      this.embedTarget.innerHTML = ''
      this.embedTarget.classList.remove('video-embed-active');
      this.embedTarget.classList.remove('video-embed-error');
    }
  }
}
