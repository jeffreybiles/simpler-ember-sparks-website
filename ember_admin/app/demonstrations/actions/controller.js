import Ember from 'ember';

export default Ember.Controller.extend({
  hatColor: "none",
  necklaceColor: "blue",
  shoeColor: "orange",

  actions: {
    changeHat(color){
      this.set('hatColor', color)
    },
    changeNecklace(color){
      this.set('necklaceColor', color)
    },
    changeShoe(color){
      this.set('shoeColor', color)
    }
  }
})
