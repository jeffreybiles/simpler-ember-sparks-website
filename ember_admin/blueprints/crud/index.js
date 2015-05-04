var fs          = require('fs-extra');
var path        = require('path');
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
    var newObjectAttrs = [];

    var entityOptions = options.entity.options;

    for (var name in entityOptions) {
      var type = entityOptions[name] || '';
      var dasherizedName = stringUtils.dasherize(name);
      var camelizedName = stringUtils.camelize(name);
      var dasherizedType = stringUtils.dasherize(type);

      modelAttrs.push(camelizedName + ': ' + dsAttr(dasherizedName, dasherizedType));
      inputAttrs.push("  <div class='crud-input'>" + dasherizedName + ": " + inputField(camelizedName, dasherizedType) + "</div>")
      displayAttrs.push("  <div class='crud-attr'>" + display(camelizedName, dasherizedType) + "</div>")
      newObjectAttrs.push(camelizedName + ': ' + newObjectDefault(dasherizedType))
    }

    modelAttrs = modelAttrs.join(',' + EOL + '  ');
    inputAttrs = inputAttrs.join(EOL);
    displayAttrs = displayAttrs.join(EOL);
    newObjectAttrs = newObjectAttrs.join(',' + EOL + '    ')

    return {
      modelAttrs: modelAttrs,
      inputAttrs: inputAttrs,
      displayAttrs: displayAttrs,
      newObjectAttrs: newObjectAttrs
    };
  },

  afterInstall: function(options) {
    addRouteToRouter(options.entity.name, {
      root: options.project.root
    });
  },
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
      return "{{input type='checkbox' checked=model." + name + "}}";
    case 'date': 
      return "{{--! Put your date code here --}}";
    default:
      return "{{input value=model." + name + "}}";
  }
}

function display(name, type) {
  return name + ": {{model." + name + "}}"
}

function newObjectDefault(type) {
  switch (type) {
    case 'boolean':
      return "false";
    default:
      return "''";
  }
}

function addRouteToRouter(name, options) {
  var routerPath = path.join(options.root, 'app', 'router.js');
  var oldContent = fs.readFileSync(routerPath, 'utf-8');
  var plural;
  var newContent;

  var funcRegex = /(map\(\s*function\(\) \{[\s\S]+)(\n^\S+)/m;


  plural = inflection.pluralize(name);

  if (plural === name) {
    plural = plural + 's';
  }
  newContent = oldContent.replace(
    funcRegex,
    "$1" + EOL +
    "  this.resource('" + plural + "', function(){" + EOL +
    "    this.route('new');" + EOL +
    "    this.resource('" + name + "', {path: '/:" + name + "_id'}, function(){" + EOL + 
    "      this.route('show');" + EOL +
    "      this.route('edit');" + EOL +
    "    });" + EOL +
    "  });" + EOL +
    "$2"
  );

  fs.writeFileSync(routerPath, newContent);
}