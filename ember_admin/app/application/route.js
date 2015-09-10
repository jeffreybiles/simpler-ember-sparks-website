import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    closeModalDialog(){
      this.controllerFor('application').set('isShowingModal', false)
    },
    showModalDialog(message){
      this.controllerFor('application').set('modalMessage', message)
      this.controllerFor('application').set('isShowingModal', true)
    }
  }
})
