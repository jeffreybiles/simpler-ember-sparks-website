import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('new');
  // this.route('edit');
  this.route('home', {path: '/'});
  this.route('bulk-add')
});

export default Router;
