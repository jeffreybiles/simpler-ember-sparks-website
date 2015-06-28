import Ember from 'ember';

export default Ember.Controller.extend({
  newTag: {
    name: '',
    description: '',
    tagType: '',
    priority: ''
  },

  actions: {
    save: function(){
      var tag = this.store.createRecord('tag', this.get('newTag'));
      tag.save().then((response)=>{
        this.transitionTo('tag.show', response);
      });
    }
  }
});
