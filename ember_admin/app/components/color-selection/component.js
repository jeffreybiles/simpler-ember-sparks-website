import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    putOnItem(color){
      this.sendAction('putOnItem', color)
    }
  }
})
