import Ember from 'ember';

export default Ember.Controller.extend({
  firstName: 'Tony',
  lastName: 'Stark',
  fullName: Ember.computed('firstName', 'lastName', function(){
    return `${this.get('firstName')} ${this.get('lastName')}`;
  }),
  companyName: 'Stark Industries',
  businessCard: Ember.computed('fullName', 'companyName', function(){
    return `${this.get('fullName')} of ${this.get('companyName')}`
  })
});
