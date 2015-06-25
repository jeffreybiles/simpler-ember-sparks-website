import Ember from 'ember';

export default Ember.Component.extend({  
  tagName: 'div',
  classNames: ['uploader', 'dropzone'],

  dragOver(event) {
    event.preventDefault()
  },

  drop(event) {
    event.preventDefault()

    var file = event.dataTransfer.files[0]
    this.sendAction('fileInputChanged', file)
  }
});