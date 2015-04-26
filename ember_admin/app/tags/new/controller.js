import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    save: function(){
      var tag = this.store.createRecord('tag', this.get('model'));
      tag.save().then((response)=>{
        this.transitionTo('tag.show', response)
      })
    }
  }
});
