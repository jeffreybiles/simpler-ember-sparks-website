import Ember from 'ember';

export default Ember.Controller.extend({
  newPost: {
    checked: false,
    title: '',
    videoUrl: '',
    description: ''
  },

  actions: {
    save: function(){
      var post = this.store.createRecord('post', this.get('newPost'));
      var file = document.getElementById('file-field').files[0];
      post.set('thumbnailImage', file);

      post.save().then((response)=>{
        this.transitionTo('post.show', response);
      });
    }
  }
});