import Ember from 'ember';

// much of this component taken from http://webcloud.info/blog/2015/03/09/ember-drag-drop-file-upload-the-rightish-way
export default Ember.Component.extend({  
  tagName: 'div',
  classNames: ['uploader', 'dropzone'],
  classNameBindings: ['isDragging'],


  dragOver: function(event){
    event.preventDefault();
  },

  dragEnter: function(event){
    event.preventDefault();
    this.set('isDragging', true);
  },

  dragLeave: function(event){
    event.preventDefault();
    this.set('isDragging', false);
  },

  drop: function(event){
    event.preventDefault();
    this.set('isDragging', false);

    var file = event.dataTransfer.files[0];
    this.sendAction('fileInputChanged', file);
  }
});