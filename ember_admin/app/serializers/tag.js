import DS from 'ember-data';

export default DS.ActiveModelSerializer.extend({
  isNewSerializerAPI: true,
  attrs: {
    seconds: {serialize: false},
    readableTime: {serialize: false}
  }
});
