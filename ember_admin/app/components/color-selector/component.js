import Ember from 'ember';

export default Ember.Component.extend({
  colors: ["blue", "red", "green", "purple", "orange"],
  actions: {
    putOnItem(color){
      this.sendAction('putOnItem', color)
    }
  }
});
