import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'div',
  classNames: ['uploader', 'dropzone'],
  isDragging: Ember.computed.gt('dragCounter', 0),
  classNameBindings: ['isDragging'],
  dragCounter: 0,

  dragEnter() {
    this.incrementProperty('dragCounter')
  },
  dragLeave(){
    this.decrementProperty('dragCounter')
  },

  dragOver(event) {
    event.preventDefault()
  },

  drop(event) {
    event.preventDefault()

    this.set('dragCounter', 0)

    var file = event.dataTransfer.files[0]
    this.sendAction('fileInputChanged', file)
  }
});
