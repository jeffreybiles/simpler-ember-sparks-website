import Ember from 'ember';

export default Ember.Component.extend({
  colors: ["blue", "red", "green", "purple", "orange", "none"],
  actions: {
    changeItem(color){
      var matches = this.attrs.changeItem(color)
      if(matches){
        this.$(`.${color}`).effect('pulsate')
      }
    }
  }
});
