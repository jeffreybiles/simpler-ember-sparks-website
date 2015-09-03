import Ember from 'ember';

export default Ember.Controller.extend({
  hasHat: false,
  hatColor: "blue",
  colors: ["blue", "red", "green", "purple", "orange"],
  actions: {
    putOnHat(color){
      this.set('hatColor', color)
      this.set('hasHat', true)
    },
    takeOffHat(){
      this.set('hasHat', false)
    }
  }
})
