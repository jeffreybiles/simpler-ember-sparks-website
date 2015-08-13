import Base from 'ember-validations/validators/base';

export default Base.extend({
  call: function(){
    var email = this.model.get(this.property)
    if(!email){
      this.errors.pushObject("Must include an email")
    } else if(!email.match(/.*@.*\..*/)){
      this.errors.pushObject("Must be formatted like an email")
    }
  }
});
