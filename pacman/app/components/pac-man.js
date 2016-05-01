import PacMan from 'pac-man/components/pac-man';
import MyLevel from '../models/my-level';
import MsPac1 from 'pac-man/models/ms-pac-1';
import MsPac2 from 'pac-man/models/ms-pac-2';
import MsPac3 from 'pac-man/models/ms-pac-3';
import MsPac4 from 'pac-man/models/ms-pac-4';

var levels = [MsPac1, MsPac2, MsPac3, MsPac4];

levels.forEach(function(level){
  level.reopen({
    squareSize: 20
  })
})

export default PacMan.extend({
  levels: levels
})
