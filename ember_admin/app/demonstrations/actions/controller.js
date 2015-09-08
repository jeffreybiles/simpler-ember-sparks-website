import Ember from 'ember';

export default Ember.Controller.extend({
  isShowingModal: false,
  actions: {
    closeModal(){
      this.set('isShowingModal', false)
    },
    displayModal(message){
      this.set('modalMessage', message)
      this.set('isShowingModal', true)
    }
  }
})
