import Ember from 'ember';

export default Ember.Controller.extend({
  newLineSeparatedUsers: '',
  users: Ember.computed('newLineSeparatedUsers', function(){
    var lines = this.get('newLineSeparatedUsers').split('\n')
    var users = lines.filter(function(line){
      return line !== ''
    })
    return users
  })
})
