import Ember from 'ember';

export default Ember.Controller.extend({
  newLineSeparatedUsers: '',
  users: Ember.computed('newLineSeparatedUsers', function(){
    var lines = this.get('newLineSeparatedUsers').split('\n')
    var users = lines.filter( line => line !== '')
    return users
  }),
  actions: {
    addUsers(){
      $.ajax('api/users/bulk_add', {
        method: 'POST',
        data: {users: this.get('users')}
      })
      this.transitionToRoute('home')
    }
  }
})
