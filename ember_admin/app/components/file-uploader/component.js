import Ember from 'ember';

// much of this component taken from http://webcloud.info/blog/2015/03/09/ember-drag-drop-file-upload-the-rightish-way
export default Ember.Component.extend({  
  tagName: 'div',
  classNames: ['uploader', 'dropzone'],
  classNameBindings: ['isDragging'],
  isDragging: Ember.computed.gt('dragNestings', 0),
  dragNestings: 0,


  dragOver: function(event){
    event.preventDefault();
  },

  dragEnter: function(event){
    this.incrementProperty('dragNestings');
  },

  dragLeave: function(event){
    this.decrementProperty('dragNestings');
  },

  drop: function(event){
    event.preventDefault();
    this.set('dragNestings', 0);

    var file = event.dataTransfer.files[0];
    this.sendAction('fileInputChanged', file);
  }
});