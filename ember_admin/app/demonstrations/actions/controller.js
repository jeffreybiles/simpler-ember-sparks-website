import Ember from 'ember';

export default Ember.Controller.extend({
  items: Ember.computed.alias('global.accessoryTypes'),
  itemDetails: Ember.computed('items', function(){
    return this.get("items").map(function(itemName){
      return {
        itemName: itemName,
        itemColor: 'none'
      }
    })
  }),

  matchesAnotherItem(itemIndex){
    var color = this.get(`itemDetails.${itemIndex}.itemColor`)
    return this.get('itemDetails').any(function(item, index){
      return Ember.get(item, 'itemColor') == color && index != itemIndex
    })
  },

  actions: {
    changeItem(itemIndex, newColor){
      this.set(`itemDetails.${itemIndex}.itemColor`, newColor)
      return this.matchesAnotherItem(itemIndex)
    }
  }
})
