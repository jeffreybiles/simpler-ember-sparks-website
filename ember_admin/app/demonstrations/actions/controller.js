import Ember from 'ember';

export default Ember.Controller.extend({
  wearingAHat: true,
  actions: {
    putOnHat(){
      this.set('wearingAHat', true)
    },
    takeOffHat(){
      this.set('wearingAHat', false)
    }
  }
})
