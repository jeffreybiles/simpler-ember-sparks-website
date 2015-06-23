import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'button',
  click: function(event){
    event.preventDefault()
    alert('you clicked an alert-maker!')
    return false
  }
})