import DS from 'ember-data';

export default DS.ActiveModelSerializer.extend({
  attrs: {
    seconds: {serialize: false},
    readableTime: {serialize: false}
  }
});
