import Ember from 'ember';

export default Ember.Controller.extend({
  tags: Ember.computed(function(){
    return this.store.find('tag');
  }),
  actions: {
    save: function(){
      this.get('model').save().then(()=>{
        this.transitionToRoute('post.show', this.get('model'))
      })
    },
    addTag: function(tag){
      this.store.createRecord('tagging', {
        tag: tag,
        post: this.get('model')
      }).save();
    },
    removeTag: function(tagging){
      tagging.destroyRecord();
    }
  }
})