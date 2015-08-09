import Ember from 'ember';
import PostValidations from 'ember-admin/mixins/validations/post';

export default Ember.Controller.extend(PostValidations, {
  tags: Ember.computed(function(){
    return this.store.find('tag');
  }),
  subjects: Ember.computed.filterBy('tags', 'tagType', 'subject'),
  subjectsSort: ['taggings.length:desc'],
  sortedSubjects: Ember.computed.sort('subjects', 'subjectsSort'),
  unusedTags: Ember.computed('sortedSubjects.@each', 'model.taggings.@each', function(){
    var all = this.get('sortedSubjects')
    var used = this.get('model.taggings').mapBy('tag.content')
    return _.difference(all, used)
  }),
  actions: {
    save: function(){
      var model = this.get('model')
      var file = model.get('temporaryThumbnailImage')
      model.set('thumbnailImage', file);
      this.validate().then(()=>{
        model.save().then(()=>{
          this.transitionToRoute('post.show', model)
        })
      }).catch(()=>{
        console.log(this.get("errors"))
      })

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
  },
});
