import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    save: function(){
      var <%= classifiedModuleName %> = this.store.createRecord('<%= dasherizedModuleName %>', this.get('model'));
      <%= classifiedModuleName %>.save().then((response)=>{
        this.transitionTo('<%= dasherizedModuleName %>.show', response)
      })
    }
  }
});
