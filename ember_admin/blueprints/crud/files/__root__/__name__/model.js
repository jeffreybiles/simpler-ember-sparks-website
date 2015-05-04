import DS from 'ember-data';

export default DS.Model.extend({
  <%= modelAttrs %>,

  //this is what's used when listing records
  toS: Ember.computed.alias('name') 
  }
})