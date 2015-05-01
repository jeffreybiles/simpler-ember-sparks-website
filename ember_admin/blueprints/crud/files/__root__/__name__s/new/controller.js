import Ember from 'ember';

export default Ember.Controller.extend({
  new<%= classifiedModuleName %>: {
    // properties here
  },
  actions: {
    save: function(){
      var <%= classifiedModuleName %> = this.store.createRecord('<%= dasherizedModuleName %>', this.get('new<%= classifiedModuleName %>'));
      <%= classifiedModuleName %>.save().then((response)=>{
        this.transitionTo('<%= dasherizedModuleName %>.show', response)
      })
    }
  }
});
