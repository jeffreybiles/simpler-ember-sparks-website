var GlobalConfig = Ember.Object.extend({
  globals: Ember.computed(function(){
    return $('#global-stash').data('globals')
  }),
  accessoryTypes: Ember.computed('globals', function(){
    return this.get("globals.accessories")
  })
})

export function initialize(application) {
  application.container.register('stuff:global', GlobalConfig)
  application.registry.injection('controller', 'global', 'stuff:global')
}

export default {
  name: 'load-custom-config',
  initialize: initialize
};
