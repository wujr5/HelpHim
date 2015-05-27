if Meteor.isClient
  window.AllTasks = new Mongo.Collection('allTasks')
else
  AllTasks = new Mongo.Collection('allTasks')
  AllTasks.insert {name: 'wujiarong', age: 20}