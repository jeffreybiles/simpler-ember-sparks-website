import Ember from 'ember';

export default Ember.Controller.extend({
  store: Ember.inject.service(),
  newLineSeparatedUsers: '',
  users: Ember.computed('newLineSeparatedUsers', function(){
    var lines = this.get('newLineSeparatedUsers').split('\n')
    var users = lines.filter(function(line){
      return line !== ''
    })
    return users
  }),
  actions: {
    createOrganization(){
      var store = this.get('store');
      var organization = store.createRecord('organization', {
        name: this.get('organizationName')
      })
      organization.save()
      this.transitionToRoute('bulk-add')
    }
  }
})
