import Ember from 'ember';

export default Ember.Controller.extend({
  tags: Ember.computed(function(){
    return this.store.find('tag');
  }),
  subjects: Ember.computed.filterBy('tags', 'tagType', 'subject'),
  subjectsSort: ['taggings.length:desc'],
  sortedSubjects: Ember.computed.sort('subjects', 'subjectsSort'),
  actions: {
    save: function(){
      var file = this.get('model.temporaryThumbnailImage')
      this.set('model.thumbnailImage', file);
      this.get('model').save().then(()=>{
        this.transitionToRoute('post.show', this.get('model'));
      });
    },
    addTag: function(tag){
      this.store.createRecord('tagging', {
        tag: tag,
        post: this.get('model')
      }).save();
    },
    removeTag: function(tagging){
      tagging.destroyRecord();
    }
  }
});