import Ember from 'ember';

export default Ember.Controller.extend({
  hatColor: "none",
  necklaceColor: "blue",
  shoeColor: "orange",

  actions: {
    changeItem(itemColor, newColor){
      this.set(itemColor, newColor)
    }
  }
})
