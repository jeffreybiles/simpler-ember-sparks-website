import Ember from 'ember';

export default {
  name: 'ajax-prefilter',
  initialize: function(container, app){
    Ember.$.ajaxPrefilter(function(options, originalOptions, jqXHR) {
      var token = $('meta[name="csrf-token"]').attr('content');
      if(token){
        jqXHR.setRequestHeader('X-CSRF-Token', token);
      }
    });
  }
};