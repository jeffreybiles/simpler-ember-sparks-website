import Ember from 'ember';
import EmberValidations, { validator } from 'ember-validations';

export default Ember.Controller.extend(EmberValidations, {
  queryParams: ['specialScrutiny'],
  specialScrutiny: false,
  showErrors: true,
  validations: {
    username: {
      presence: true
    },
    email: {
      email: true,
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
      inclusion: {
        'if': 'specialScrutiny',
        in: ['Human', 'Homo Sapiens', 'Person'],
        message: 'Be more specific'
      }
    },
    xor: {
      xor: {keyOne: 'xor1', keyTwo: 'xor2'}
    }
  },
  xor1: true,
  xor2: true
})
