import Ember from 'ember';

export default Ember.Component.extend({
  previewImage: Ember.observer('file', function(){
    var file = document.getElementById('file-field').files[0];
    if (file) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#preview-image').attr('src', e.target.result);
      };

      reader.readAsDataURL(file);
    }
  })
});