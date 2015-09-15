import Ember from 'ember';

export default Ember.Component.extend({
  hasItem: false,
  itemColor: "blue",
  actions: {
    putOnItem(color){
      this.set('itemColor', color)
      this.set('hasItem', true)
      this.sendAction('pressRelease')
    },
    takeOffItem(){
      this.set('hasItem', false)
      this.sendAction('takeOffItem')
    },
    howToRemoveItem(){
      this.sendAction('showModalDialog', 'we realize it is difficult to remove our proprietary vicelok Items')
    }
  }
})
