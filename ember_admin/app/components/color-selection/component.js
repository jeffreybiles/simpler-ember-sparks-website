import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    putOnHat(color){
      this.sendAction('putOnHat', color)
    }
  }
})
