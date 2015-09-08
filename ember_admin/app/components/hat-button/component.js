import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'button',
  attributeBindings: ['style'],
  style: Ember.computed('color', function(){
    return `color: ${this.get('color')}`
  }),
  click(){
    this.sendAction('action', this.get('color'))
  }
})
