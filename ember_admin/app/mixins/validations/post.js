import Ember from 'ember';
import EmberValidations from 'ember-validations';

export default Ember.Mixin.create(EmberValidations, {
  validations: {
    "model.title": {
      presence: true,
      length: {minimum: 5, maximum: 300}
    },
    "model.seconds": {
      numericality: true
    }
  },
});
