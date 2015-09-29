// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

console.log('is this thing on?')
$(document).on('click', '.clickable-media-link', function(event){
  console.log("it got a click")
  path = $(this).data('url')
  console.log(path)
  window.location.href = path
})
