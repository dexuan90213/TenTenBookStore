import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "items" ]

  update(evt) {
    this.itemsTarget.innerText = evt.detail[0]['items']

    let msg_window = document.querySelector('#message-window')
    let content = document.querySelector('#message-content')

    content.innerText = "已加到購物車"
    msg_window.classList.add("is-active")
  }

}
