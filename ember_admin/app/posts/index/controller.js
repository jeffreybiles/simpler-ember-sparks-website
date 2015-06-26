import Ember from 'ember';

export default Ember.Controller.extend({
  monthsData: Ember.computed(function(){
    var publishHash = this.get('model').map(function(post){
      return post
    });
    return _.groupBy(publishHash, function(post){
      return moment(post.get('publishDate')).format('M/YYYY');
    });
  }),
  monthLabels: Ember.computed(function(){
    var year = 2014;
    var month = 1;
    var months = [];
    while(moment().format('M/YYYY') !== `${month}/${year}`){
      if(month > 12){
        month = 1;
        year = year + 1;
      } else {
        months.pushObject(`${month}/${year}`);
        month = month + 1;
      }
    }
    return months;
  }),
  numberData: Ember.computed(function(){
    return {
      labels: this.get('monthLabels'),
      datasets: [{
        label: 'Number of Screencasts',
        data: this.get('monthLabels').map((monthLabel)=>{
          var postsInMonth = this.get('monthsData')[monthLabel];
          if(!postsInMonth){
            return 0;
          } else {
            return postsInMonth.length;
          }
        })
      }]
    };
  }),
  timeData: Ember.computed(function(){
    return {
      labels: this.get('monthLabels'),
      datasets: [{
        label: 'Minutes of Screencasting',
        data: this.get('monthLabels').map((monthLabel)=>{
          var postsInMonth = this.get('monthsData')[monthLabel];
          if(!postsInMonth){
            return 0;
          } else {
            return _.reduce(postsInMonth.mapBy('seconds'), function(memo, seconds){
              return memo + (seconds/60);
            }, 0);
          }
        })
      }]
    };
  }),
  lineChartOptions: {
  },
});