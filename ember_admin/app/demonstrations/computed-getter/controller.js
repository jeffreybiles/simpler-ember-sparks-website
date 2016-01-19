import Ember from 'ember';
import computed from 'ember-computed-decorators'

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

  @computed('documentaries.@each.name')
  listOfTitles: {
    get(documentaries){
      return documentaries.mapBy('name').join(', ');
    },
    set(listOfTitles, documentaries){
      let arrayOfTitles = listOfTitles.split(', ');
      arrayOfTitles.forEach((title, index)=>{
        let documentary = this.get(`documentaries.${index}`)
        Ember.set(documentary, 'name', title)
      })
      return listOfTitles
    }
  },

  @computed('documentaries.@each.budget')
  totalDocumentaryBudget(documentaries){
    var totalBudget = 0;
    documentaries.forEach(function(documentary){
      totalBudget += Number(documentary.budget);
    })
    return totalBudget
  },

  @computed('documentaries.@each.{budget,boxOffice}')
  totalDocumentaryProfit(documentaries){
    var totalProfit = 0;
    documentaries.forEach(function(documentary){
      totalProfit += Number(documentary.boxOffice);
      totalProfit -= Number(documentary.budget);
    })
    return totalProfit
  }
});
