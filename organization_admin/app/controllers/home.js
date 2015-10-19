import Ember from 'ember';

export default Ember.Controller.extend({
  monthlyBill: Ember.computed('model', function(){
    return Math.round(this.get('model.length') * 9.95 * 100)/100;
  })
})
