import Ember from 'ember';
import PostValidations from 'ember-admin/mixins/validations/post';

export default Ember.Controller.extend(PostValidations, {
  showErrors: false,
  actions: {
    save: function(){
      var post = this.store.createRecord('post', this.get('model'));
      var file = post.get('temporaryThumbnailImage')
      post.set('thumbnailImage', file);
      this.validate().then(()=>{
        post.save().then((response)=>{
          this.transitionTo('posts.post.show', response);
        });
      }).catch(()=>{
        this.set('showErrors', true)
        console.log(this.get("errors"))
      })
    }
  }
});
