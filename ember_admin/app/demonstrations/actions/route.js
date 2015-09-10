import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    takeOffItem(){
      this.send('showModalDialog', 'We mourn the loss of your accessory.')
    },
    putOnItem(){
      alert('This will never be reached.')
    },
    pressRelease(){
      this.send('showModalDialog', 'Very accessory.  Much disrupt.')
    }
  }
})
