import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

export default Router.map(function() {
  this.resource('tags', function(){
    this.route('new');
    this.route('charts');
    this.resource('tag', {path: ':tag_id'}, function(){
      this.route('show');
      this.route('edit');
    });
  });
  this.resource('posts', function() {
    this.route('new');
    this.resource('post', {path: ':post_id'}, function(){
      this.route('show');
      this.route('edit');
    });
  });
  this.resource('demonstrations', function(){
    this.route('computed-getter')
    this.route('fancy-validations')
  })
});
