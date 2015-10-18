import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  isSubscribed: DS.attr('boolean'),
  users: DS.hasMany('user')
})
