import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    edit: function(){
      this.set('isEditing', true)
    },
    save: function(){
      this.get("model").save().then( ()=>{
        this.set('isEditing', false)
      })
    },
    delete: function(){
      this.get("model").destroyRecord().then( ()=>{
        this.transitionToRoute('<%= dasherizedModuleName %>s')
      })
    }
  }
})