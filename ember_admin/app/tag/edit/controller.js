import Ember from 'ember';

export default Ember.Controller.extend({
  posts: Ember.computed(function(){
    return this.store.findAll('post');
  }),
  postsSort: ['publishDate:desc'],
  sortedPosts: Ember.computed.sort('posts', 'postsSort'),
  unusedPosts: Ember.computed('sortedPosts.@each', 'model.taggings.@each', function(){
    var all = this.get('sortedPosts')
    var used = this.get('model.taggings').mapBy('post.content')
    return _.difference(all, used)
  }),
  actions: {
    save: function(){
      this.get("model").save().then(()=>{
        this.transitionToRoute('tag.show');
        this.get('flashMessages').success('saved!')
      });
    },
    addPost: function(post){
      this.store.createRecord('tagging', {
        tag: this.get('model'),
        post: post
      }).save();
    },
    removePost: function(tagging){
      tagging.destroyRecord();
    }
  }
});
