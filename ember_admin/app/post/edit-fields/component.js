import Ember from 'ember';

export default Ember.Component.extend({
  previewImage(file) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('#preview-image').attr('src', e.target.result);
    }

    reader.readAsDataURL(file);
  },

  actions: {
    receiveFile(file) {
      this.set('model.temporaryThumbnailImage', file);
      this.previewImage(file);
    }
  }
})