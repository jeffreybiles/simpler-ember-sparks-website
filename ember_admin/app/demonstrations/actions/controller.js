import Ember from 'ember';

export default Ember.Controller.extend({
  wearingAHat: true,
  hatColor: "blue",
  hatColors: ["blue", "green", "red", "purple", "orange"],
  actions: {
    putOnHat(color){
      this.set('wearingAHat', true)
      this.set('hatColor', color)
    },
    takeOffHat(){
      this.set('wearingAHat', false)
    }
  }
})
