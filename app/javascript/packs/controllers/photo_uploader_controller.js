import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "embed" ]

  update(event) {
    this.renderEmbed();
  }
 
  renderEmbed() {
    var reader = new FileReader();
    reader.onload = () => {
        this.embedTarget.src = reader.result;
    }
    reader.readAsDataURL(event.target.files[0]);
    if (this.inputTarget.dataset.multiple === 'true') {
      this.inputTarget.closest('.file-input').classList.add('d-none');
    }
  }
}
