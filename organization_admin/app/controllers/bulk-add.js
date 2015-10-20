import Ember from 'ember';

export default Ember.Controller.extend({
  newLineSeparatedUsers: '',
  users: Ember.computed('newLineSeparatedUsers', function(){
    var lines = this.get('newLineSeparatedUsers').split('\n')
    var users = lines.filter( line => line !== '')
    return users
  }),
  monthlyBill: Ember.computed('users', function(){
    return Math.round(this.get('users.length') * 9.95 * 100)/100;
  }),
  actions: {
    addUsers(){
      $.ajax('api/users/bulk_add', {
        method: 'POST',
        data: {users: this.get('users')}
      })
      window.location.href = '/organization_admin'
    }
  }
})
