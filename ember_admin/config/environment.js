/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'ember-admin',
    environment: environment,
    baseURL: '/ember_admin/',
    locationType: 'hash',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    },

    contentSecurityPolicy: {
      'default-src': "'self' http://platform.twitter.com",
      'script-src': "'self' http://www.google-analytics.com/analytics.js http://platform.twitter.com/widgets.js http://i.kissmetrics.com/i.js http://doug1izaerwt3.cloudfront.net",
      'font-src': "'self' https://fonts.gstatic.com",
      'connect-src': "'self'",
      'img-src': "'self' http://www.google-analytics.com http://trk.kissmetrics.com https://spark-casts.s3.amazonaws.com",
      'style-src': "'self' https://fonts.googleapis.com",
      'media-src': "'self'"
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
