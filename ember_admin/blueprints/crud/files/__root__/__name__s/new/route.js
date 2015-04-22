import Ember from 'ember';

export default Ember.Route.extend({
  model: function(){
    return this.store.createRecord('<%= dasherizedModuleName %>');
  },

  actions: {
    save: function(){
      this.modelFor('<%= dasherizedModuleName %>s.new').save().then((response)=>{
        this.transitionTo('<%= dasherizedModuleName %>.show', response)
      })
    }
  }
});
