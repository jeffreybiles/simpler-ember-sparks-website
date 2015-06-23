import Ember from 'ember';

export default Ember.Component.extend({
  previewImage: Ember.observer('model.temporaryThumbnailImage', function(){
    var file = this.get('model.temporaryThumbnailImage')
    if (file) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#preview-image').attr('src', e.target.result);
      }

      reader.readAsDataURL(file);
    }
  }),

  actions: {
    receiveFile: function(file){
      this.set('model.temporaryThumbnailImage', file);
    }
  }
})