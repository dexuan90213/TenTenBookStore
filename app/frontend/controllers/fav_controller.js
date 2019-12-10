import { Controller } from "stimulus"
import axios from "axios"

export default class extends Controller {
  static targets = [ "icon" ]

  connect() {
    console.log('hi')
  }

  toggle(evt) {
    evt.preventDefault()

    const token = document.querySelector("meta[name=csrf-token]") || { content: 'no-csrf-token' }

    var ax = axios.create({
      headers: {
        common: {
          'X-CSRF-TOKEN': token.content
        }
      }
    })

    ax.post('/api/books/3/favorite')
         .then(function (response) {
           console.log(response.data)
         })
         .catch(function (error) {
           console.log(error)
         })
  }
}
