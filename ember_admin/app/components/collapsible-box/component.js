import Ember from 'ember';

export default Ember.Component.extend({
  isShowing: true,
  actions: {
    close(){
      this.set('isShowing', false)
    },
    open(){
      this.set('isShowing', true)
    }
  }
});
