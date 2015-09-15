import Ember from 'ember';

export default Ember.Component.extend({
  colors: ["blue", "red", "green", "purple", "orange", "none"],
  actions: {
    changeItem(color){
      this.attrs.changeItem(color)
    }
  }
});
