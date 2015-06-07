import Ember from 'ember';

export default Ember.Controller.extend({
  numberData: Ember.computed(function(){
    return {
      labels: this.get('model').mapBy('name'),
      datasets: [{
        label: 'Number of Screencasts',
        data: this.get('model').mapBy('taggings.length')
      }]
    }
  }),
  timeData: Ember.computed(function(){
    return {
      labels: this.get('model').mapBy('name'),
      datasets: [{
        label: 'Minutes of video available',
        data: this.get('model').mapBy('seconds').map(function(time){
          return time/60
        })
      }]
    }
  }),
  barChartOptions: {
  },
  numberPieData: Ember.computed(function(){
    return this.get('model').map(function(tag){
      return {
        value: tag.get('taggings.length'),
        label: tag.get('name'),
        color: `rgb(${Math.random() * 100}%, ${Math.random() * 100}%, ${Math.random() * 100}%)`,
        highlight: '#000'
      }
    })
  }),
  timePieData: Ember.computed(function(){
    return this.get('model').map(function(tag){
      return {
        value: tag.get('seconds'),
        label: tag.get('name'),
        color: `rgb(${Math.random() * 100}%, ${Math.random() * 100}%, ${Math.random() * 100}%)`,
        highlight: '#000'        
      }
    })
  })
})