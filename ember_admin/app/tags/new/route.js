import Ember from 'ember';

export default Ember.Route.extend({
  model: function(){
    return this.store.createRecord('tag');
  },

  actions: {
    save: function(){
      this.modelFor('tags.new').save().then((response)=>{
        this.transitionTo('tag.show', response)
      })
    }
  }
});
