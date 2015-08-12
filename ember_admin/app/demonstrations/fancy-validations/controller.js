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
      inclusion: {
        'if': 'specialScrutiny',
        in: ['Human', 'Homo Sapiens', 'Person'],
        message: 'Be more specific'
      }
    },
    xor: {
      acceptance: {message: 'gotta have one or the other'},
      inline: validator(function(){
        if(!((this.model.get("xor1") && !this.model.get("xor2")) ||
          (this.model.get("xor2") && !this.model.get("xor1")))){
             return "Must be xor"
           }
      })
    }
  },
  xor: Ember.computed('xor1', 'xor2', function(){
    return ((this.get("xor1") && !this.get("xor2")) ||
           (this.get("xor2") && !this.get("xor1")))
  }),
  xor1: true,
  xor2: true
})
