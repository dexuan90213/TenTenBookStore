import 'flatpickr/dist/flatpickr.min.css'
// import flatpickr from 'flatpickr/dist/flatpickr.min.js'
import flatpickr from 'flatpickr'

document.addEventListener('turbolinks:load', function(){
  flatpickr('#book_published_at', {})
})
