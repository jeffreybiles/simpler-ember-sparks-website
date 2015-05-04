var inflection  = require('inflection');
var stringUtils = require('../../lib/utilities/string');
var EOL         = require('os').EOL;

module.exports = {
  description: 'generates a CRUD setup',

  anonymousOptions: [
    'name',
    'attr:type'
  ],

  locals: function(options) {
    var modelAttrs = [];
    var inputAttrs = [];
    var displayAttrs = [];

    var entityOptions = options.entity.options;

    for (var name in entityOptions) {
      var type = entityOptions[name] || '';
      var dasherizedName = stringUtils.dasherize(name);
      var camelizedName = stringUtils.camelize(name);
      var dasherizedType = stringUtils.dasherize(type);

      modelAttrs.push(camelizedName + ': ' + dsAttr(dasherizedName, dasherizedType));
      inputAttrs.push("  <div class='crud-input'>" + inputField(dasherizedName, dasherizedType) + "</div>")
      displayAttrs.push("  <div class='crud-attr'>" + display(dasherizedName, dasherizedType) + "</div>")

    }

    modelAttrs = modelAttrs.join(',' + EOL + '  ');
    inputAttrs = inputAttrs.join(EOL);
    displayAttrs = displayAttrs.join(EOL);

    return {
      modelAttrs: modelAttrs,
      inputAttrs: inputAttrs,
      displayAttrs: displayAttrs
    };
  }
}

function dsAttr(name, type) {
  switch (type) {
  case 'boolean':
  case 'date':
  case 'number':
  case 'string':
    return 'DS.attr(\'' + type + '\')';
  default:
    //"If you don't specify the type of the attribute, it will be whatever was provided by the server"
    //http://emberjs.com/guides/models/defining-models/
    return 'DS.attr()';
  }
}

function inputField(name, type) {
  switch (type) {
    case 'boolean':
      return "<input type='checkbox' checked=" + name + ">"
    case 'date': 
      return "{{--! Put your date code here --}}"
    default:
      return "<input type='text' value=" + name + ">"
  }
}

function display(name, type) {
  return name + ": {{" + name + "}}"
}