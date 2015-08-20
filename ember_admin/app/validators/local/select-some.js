import Base from 'ember-validations/validators/base';

export default Base.extend({
  init: function(){
    this._super()

    this.options.selections.forEach((selection)=>{
      this.dependentValidationKeys.pushObject(selection)
    })
  },
  call: function(){
    var correctLength = this.options.correctLength
    var selections = Ember.A(this.options.selections)
    var selectedSelections = selections.filter((selection)=>{return this.model.get(selection)})
    if(selectedSelections.length < correctLength){
      this.errors.pushObject("Select another!")
    } else if(selectedSelections.length > correctLength){
      this.errors.pushObject("Too many selected")
    }
  }
})
