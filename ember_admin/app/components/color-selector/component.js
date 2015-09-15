import Ember from 'ember';

export default Ember.Component.extend({
  colors: ["blue", "red", "green", "purple", "orange", "none"],
  actions: {
    changeItem(color){
      this.sendAction('changeItem', color)
    }
  }
});
