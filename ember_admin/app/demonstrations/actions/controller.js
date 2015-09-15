import Ember from 'ember';

export default Ember.Controller.extend({
  items: ['hat', 'necklace', 'shoe'],
  itemDetails: Ember.computed(function(){
    return this.get("items").map(function(itemName){
      return {
        itemName: itemName,
        itemColor: 'none'
      }
    })
  }),

  actions: {
    changeItem(itemName, newColor){
      this.set(`itemDetails.${itemName}.itemColor`, newColor)
    }
  }
})
