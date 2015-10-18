import Ember from 'ember';

export default Ember.Controller.extend({
  store: Ember.inject.service(),

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
