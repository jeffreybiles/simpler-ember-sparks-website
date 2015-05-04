import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  free: DS.attr('boolean'),
  videoUrl: DS.attr('string'),
  description: DS.attr('string'),

  //this is what's used when listing records
  toS: Ember.computed.alias('title')
})