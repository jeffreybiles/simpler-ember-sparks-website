import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

export default Router.map(function() {
  this.resource('posts', function() {
    this.resource('post', {path: ':post_id'});
  });
  this.resource('tags', function(){
    this.route('new');
    this.resource('tag', {path: ':tag_id'}, function(){
      this.route('show');
      this.route('edit');
    })
  })
});
