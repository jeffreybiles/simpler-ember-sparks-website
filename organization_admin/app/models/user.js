import DS from 'ember-data';

export default DS.Model.extend({
  email: DS.attr('string'),
  state: DS.attr('string'),

  isSubscribed: DS.attr('boolean'),
  users: DS.hasMany('user')
})
