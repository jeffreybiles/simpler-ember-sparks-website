import Ember from 'ember';

export default Ember.Controller.extend({
  posts: Ember.computed(function(){
    return this.store.find('post');
  }),
  actions: {
    save: function(){
      this.get("model").save().then(()=>{
        this.transitionToRoute('tag.show')
      })
    },
    addPost: function(post){
      this.store.createRecord('tagging', {
        tag: this.get('model'),
        post: post
      }).save();
    },
    removePost: function(tagging){
      tagging.destroyRecord();
    }
  }
})