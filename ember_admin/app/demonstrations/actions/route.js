import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    takeOffHat(){
      alert('We mourn the loss of your hat.')
    },
    putOnHat(){
      alert('This will never be reached.')
    },
    pressRelease(){
      alert('Very hat.  Much disrupt.')
    }
  }
})
