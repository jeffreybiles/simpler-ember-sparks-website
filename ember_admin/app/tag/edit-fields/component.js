import Ember from 'ember';

export default Ember.Component.extend({
  tagTypes: ['series', 'subject'],

  actions: {
    selectTagType() {
      const selectedEl = this.$('#tag-type-select')[0];
      const selectedIndex = selectedEl.selectedIndex;
      const options = $('#tag-type-select option');
      const selectedValue = options[selectedIndex].value;

      this.set('model.tagType', selectedValue);
    }
  }
});
