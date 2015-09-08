import Ember from 'ember';

export default Ember.Component.extend({
  colors: ["blue", "red", "green", "purple", "orange"],
  itemColor: 'blue',
  hasItem: false,
  actions: {
    putOnItem(color){
      this.set('color', color)
      this.set('hasItem', true)
      this.sendAction('showMessage', `You put on a ${color} ${this.get('itemName')}`)
    },
    takeOffItem(){
      this.set('hasItem', false)
      return true
    },
    howToRemoveItem(){
      alert('The lawyers said we had to provide real instructions here :(')
    }
  }
})
