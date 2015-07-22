import Ember from 'ember';

export default Ember.Controller.extend({
  firstName: 'Tony',
  lastName: 'Stark',
  fullName: Ember.computed('firstName', 'lastName', function(){
    console.log('computing fullName')
    return `${this.get('firstName')} ${this.get('lastName')}`;
  }),
  companyName: 'Stark Industries',
  businessCard: Ember.computed('fullName', 'companyName', function(){
    console.log('computing businessCard')
    return `${this.get('fullName')} of ${this.get('companyName')}`
  }),

  documentaries: [
    {name: 'Iron Man 1', release: '2008', budget: 140000000, boxOffice: 318000000},
    {name: 'Iron Man 2', release: '2010', budget: 200000000, boxOffice: 312000000},
    {name: 'The Avengers', release: '2012', budget: 220000000, boxOffice: 623000000},
    {name: 'Iron Man 3', release: '2013', budget: 200000000, boxOffice: 408000000},
    {name: 'Avengers 2', release: '2015', budget: 250000000, boxOffice: 455000000}
  ],

  totalDocumentaryBudget: Ember.computed('documentaries.@each.budget', function(){
    var totalBudget = 0;
    this.get('documentaries').forEach(function(documentary){
      totalBudget += Number(documentary.budget);
    })
    return totalBudget
  }),

  totalDocumentaryProfit: Ember.computed('documentaries.@each.{budget,boxOffice}', function(){
    var totalProfit = 0;
    this.get('documentaries').forEach(function(documentary){
      totalProfit += Number(documentary.boxOffice);
      totalProfit -= Number(documentary.budget);
    })
    return totalProfit
  })
});
