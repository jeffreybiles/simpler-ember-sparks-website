import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    pressRelease(){
      this.send('showModalDialog', 'Very accessory.  Much disrupt.')
    }
  }
})
