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
      post.set('thumbnailImage', this.get('post.temporaryThumbnailImage'));

      post.save().then((response)=>{
        this.transitionTo('post.show', response)
      })
    }
  }
})