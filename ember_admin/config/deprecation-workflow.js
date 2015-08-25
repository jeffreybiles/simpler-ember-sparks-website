window.deprecationWorkflow = window.deprecationWorkflow || {};
window.deprecationWorkflow.config = {
  workflow: [
    //Ember.Keys is in ember-validations
    { handler: "silence", matchMessage: "Ember.keys is deprecated in favor of Object.keys" },
    // TODO: Find what external library is using this
    { handler: "silence", matchMessage: "Using `Ember.HTMLBars.makeBoundHelper` is deprecated. Please refactor to using `Ember.Helper` or `Ember.Helper.helper`." },
    // TODO: Find what external library is using this
    { handler: "silence", matchMessage: "Using Ember.HTMLBars._registerHelper is deprecated. Helpers (even dashless ones) are automatically resolved." },
    // as far as I know, will not cause a problem
    { handler: "silence", matchMessage: "The default behavior of shouldReloadAll will change in Ember Data 2.0 to always return false when there is at least one \"post\" record in the store. If you would like to preserve the current behavior please override shouldReloadAll in your adapter:application and return true." },
    // as far as I know, will not cause a problem
    { handler: "silence", matchMessage: "The default behavior of `shouldBackgroundReloadRecord` will change in Ember Data 2.0 to always return true. If you would like to preserve the current behavior please override `shouldBackgroundReloadRecord` in your adapter:application and return false." },
    // as far as I know, will not cause a problem
    { handler: "silence", matchMessage: "In Ember Data 2.0, relationships will be asynchronous by default. You must set `taggings: DS.hasMany('tagging', { async: false })` if you wish for a relationship remain synchronous." },
    // as far as I know, will not cause a problem
    { handler: "silence", matchMessage: "The default behavior of shouldReloadAll will change in Ember Data 2.0 to always return false when there is at least one \"tag\" record in the store. If you would like to preserve the current behavior please override shouldReloadAll in your adapter:application and return true." },
    // this plugin has been put in bower.  Should not be a problem
    { handler: "silence", matchMessage: "The ActiveModelSerializer has been moved into a plugin. It will not be bundled with Ember Data in 2.0" }
  ]
};
