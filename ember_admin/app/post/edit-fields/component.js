import Ember from 'ember';

export default Ember.Component.extend({
  previewImage: Ember.observer('file', function(){
    var file = document.getElementById('file-field').files[0];
    if (file) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#preview-image').attr('src', e.target.result);
      }

      reader.readAsDataURL(file);
    }
  }),

  attributeBindings: ['style'],
  style: Ember.computed('backgroundColor', function(){
    return `background-color: ${this.get('backgroundColor')};`.htmlSafe();
  }),
  backgroundColor: null,
  mouseMove: function(){
    this.set('backgroundColor', this.randomColor())
  },
  randomColor: function(){
    return `rgb(${Math.random() * 100}%, ${Math.random() * 100}%, ${Math.random() * 100}%)`;
  }
})