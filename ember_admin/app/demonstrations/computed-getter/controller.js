import Ember from 'ember';

export default Ember.Controller.extend({
  firstName: 'Tony',
  lastName: 'Stark',
  fullName: Ember.computed('firstName', 'lastName', {
    get(key){
      return `${this.get('firstName')} ${this.get('lastName')}`;
    },
    set(key, fullName){
      let [firstName, lastName] = fullName.split(' ');
      this.set('firstName', firstName);
      this.set('lastName', lastName);
      return fullName;
    }
  }),
  companyName: 'Stark Industries',
  businessCard: Ember.computed('fullName', 'companyName', {
    get(key){
      return `${this.get('fullName')} of ${this.get('companyName')}`;
    },
    set(key, businessCard){
      let [fullName, companyName] = businessCard.split(' of ');
      this.set('fullName', fullName);
      this.set('companyName', companyName);
      return businessCard;
    }
  }),

  documentaries: [
    {name: 'Iron Man 1', release: '2008', budget: 140000000, boxOffice: 318000000},
    {name: 'Iron Man 2', release: '2010', budget: 200000000, boxOffice: 312000000},
    {name: 'The Avengers', release: '2012', budget: 220000000, boxOffice: 623000000},
    {name: 'Iron Man 3', release: '2013', budget: 200000000, boxOffice: 408000000},
    {name: 'Avengers 2', release: '2015', budget: 250000000, boxOffice: 455000000}
  ],

  listOfTitles: Ember.computed('documentaries.@each.name', {
    get(key){
      return this.get('documentaries').mapBy('name').join(', ');
    },
    set(key, listOfTitles){
      let arrayOfTitles = listOfTitles.split(', ');
      arrayOfTitles.forEach((title, index)=>{
        let documentary = this.get(`documentaries.${index}`)
        Ember.set(documentary, 'name', title)
      })
      return listOfTitles
    }
  }),

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
