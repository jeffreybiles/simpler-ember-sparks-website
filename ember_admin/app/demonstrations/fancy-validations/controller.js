import Ember from 'ember';
import EmberValidations from 'ember-validations';

export default Ember.Controller.extend(EmberValidations, {
  showErrors: true,
  validations: {
    username: {
      presence: true
    },
    email: {
      format: {with: /.*@.*\..*/, message: "Must be formatted like an email"}
    },
    password: {
      length: {minimum: 8},
      confirmation: true
    },
    cps: {
      inclusion: {range: [0, 9], message: "That's suspiciously fast..."},
      numericality: true
    },
    blank: {
      absence: {message: "Cylon detected"}
    },
    notABot: {
      acceptance: {accept: "affirmative"}
    },
    species: {
      exclusion: {in: ['Robot', 'Computer', 'AI', 'Cylon', 'Overlord'], allowBlank: true, message: "We don't serve your kind here"},
    },
  },
})
