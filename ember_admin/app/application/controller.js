import Ember from 'ember';

export default Ember.Controller.extend({
  navigator: Ember.inject.service(),
  breadCrumbs: Ember.computed('navigator.currentPath', function(){
    var crumbs = this.get('navigator.currentPath').split('.');
    if(this.get('navigator.isIndexRoute')){
      crumbs.popObject() //get rid of the index route at end
    }
    var breadedCrumbs = crumbs.map(function(crumb, index){
      var path = crumbs.slice(0, index).join('.');
      return {
        path: path == '' ? 'index' : path,
        name: crumb
      }
    })
    return [{path: 'index', name: 'index'}].concat(breadedCrumbs)
  })
})
