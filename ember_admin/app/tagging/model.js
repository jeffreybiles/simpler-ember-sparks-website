import DS from 'ember-data';

export default DS.Model.extend({
  tag: DS.belongsTo('tag', {async: true}),
  post: DS.belongsTo('post', {async: true}),
});