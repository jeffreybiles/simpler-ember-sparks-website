import Ember from 'ember';

export default Ember.Controller.extend({
  series: Ember.computed.filterBy('model', 'tagType', 'series'),
  subjects: Ember.computed.filterBy('model', 'tagType', 'subject'),
  uncategorized: Ember.computed.filterBy('model', 'tagType', null),
});