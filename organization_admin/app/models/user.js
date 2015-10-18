import DS from 'ember-data';

export default DS.Model.extend({
  email: DS.attr('string'),
  state: DS.attr('string'),
  organization: DS.belongsTo('organization'),
  organizationPermissionLevel: DS.attr('string'),
  invitationStatus: DS.attr('string'),

  isSubscribed: DS.attr('boolean')
})
