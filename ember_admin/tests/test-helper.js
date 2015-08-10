import resolver from './helpers/resolver';
import flashMessageHelper from './helpers/flash-message';

import registerSelectHelper from './helpers/register-select-helper';
registerSelectHelper();
import {
  setResolver
} from 'ember-qunit';

setResolver(resolver);
