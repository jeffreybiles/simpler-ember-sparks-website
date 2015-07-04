import Ember from 'ember';

export default Ember.Component.extend({
  tagTypes: ['series', 'subject'],

  actions: {
    selectTagType(value, component) {
      this.set('model.tagType', value);
    }
  }
});
