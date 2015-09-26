import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['collapsible-box'],
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
