import Base from 'ember-validations/validators/base';

export default Base.extend({
  init: function(){
    this._super()

    this.dependentValidationKeys.pushObject(this.options.keyOne);
    this.dependentValidationKeys.pushObject(this.options.keyTwo);
  },
  call: function(){
    var one = this.model.get(this.options.keyOne)
    var two = this.model.get(this.options.keyTwo)
    if((one && two) || (!one && !two)){
      this.errors.pushObject('Must be one or the other')
    }
  }
});
