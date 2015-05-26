if Meteor.isClient
  # counter starts at 0
  Session.setDefault 'counter', 0

  Template.hello.helpers do
    counter: ->
      Session.get 'counter'

  Template.hello.events do
    'click button': !->
      Session.set 'counter', (Session.get('counter') + 1)

if Meteor.isServer
  Meteor.startup !->
    console.log 'wujiaong'
