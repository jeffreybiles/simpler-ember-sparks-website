import Ember from 'ember';

export default Ember.Controller.extend({
  markedUsers: Ember.computed.filterBy('model', 'markedForDeletion'),
  safeUsers: Ember.computed.setDiff('model', 'markedUsers'),
  actions: {
    markUser(user){
      user.toggleProperty('markedForDeletion')
    },
    removeUsers(){
      var userIds = this.get('markedUsers').mapBy('id')
      $.ajax('api/users/bulk_remove', {
        method: 'POST',
        data: {users: userIds}
      })
      // this is so users get reloaded
      window.location.href = '/organization_admin'
    },
    cancel(){
      this.get('markedUsers').forEach((user)=>{
        user.set("markedForDeletion", false)
      })
      this.transitionToRoute('home')
    }
  }
})
