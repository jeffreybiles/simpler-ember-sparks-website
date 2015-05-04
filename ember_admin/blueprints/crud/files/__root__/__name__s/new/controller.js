import Ember from 'ember';

export default Ember.Controller.extend({
  new<%= classifiedModuleName %>: {
    <%= newObjectAttrs %>
  },

  actions: {
    save: function(){
      var <%= camelizedModuleName %> = this.store.createRecord('<%= dasherizedModuleName %>', this.get('new<%= classifiedModuleName %>'));
      <%= camelizedModuleName %>.save().then((response)=>{
        this.transitionTo('<%= dasherizedModuleName %>.show', response)
      })
    }
  }
});
