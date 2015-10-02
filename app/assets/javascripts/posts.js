// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on('click', '.clickable-media-link', function(event){
  path = $(this).data('url')
  window.location.href = path
})

$(document).on('click', '.clickable-external-link', function(event){
  path = $(this).data('url')
  window.open(path)
})
