import Ember from 'ember';

export default Ember.Controller.extend({
  firstName: '',
  lastName: '',
  fullName: Ember.computed('firstName', 'lastName', function(){
    return `${this.get('firstName')} ${this.get('lastName')}`;
  })
});
