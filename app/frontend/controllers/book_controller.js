import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []

  connect() {
  }

  addCart(evt) {
    evt.preventDefault()
    console.log('aaaa')
  }

}
