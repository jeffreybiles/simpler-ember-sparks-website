import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  videoUrl: DS.attr('string'),
  description: DS.attr('string'),
  transcript: DS.attr('string'),
  publishDate: DS.attr(),
  // updatedAt: DS.attr('date'),
  // createdAt: DS.attr('date'),
  thumbnailImage: DS.attr('string'),
  permalink: DS.attr('string'),
  free: DS.attr('boolean'),
  difficulty: DS.attr('string'),
  difficulties: ['basic', 'intermediate', 'advanced'],
  taggings: DS.hasMany('tagging')
});
