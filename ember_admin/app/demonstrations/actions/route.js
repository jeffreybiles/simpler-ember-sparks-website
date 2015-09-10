import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    takeOffHat(){
      this.send('showModalDialog', 'We mourn the loss of your hat.')
    },
    putOnHat(){
      alert('This will never be reached.')
    },
    pressRelease(){
      this.send('showModalDialog', 'Very hat.  Much disrupt.')
    }
  }
})
