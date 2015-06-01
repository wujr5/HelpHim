# Template.oneTaskContent.onRendered !->
#   @$('#edit').editable({inlineMode: false})
#   @$('.froala-box').children().eq(2).remove()

Template.oneTaskContent.helpers do
  task: ->
    AllTasks.findOne!
  isExecutant: (executant)->
    Meteor.user().username == executant
  isPublisher: (publisher)->
    Meteor.user().username == publisher
  isAdmin: ->
    Meteor.user().username == 'admin'
  canBeApply: (task)->
    if task.executant == null and task.deadline > (new Date()) and task.createdBy != Meteor.user().username
      return true
    false
  userImageSrc: (name)->
    'images/hd.jpg'
    # console.log Meteor.users.findOne({username: name}).profileImage
    # Meteor.users.findOne({username: name}).profileImage

Template.oneTaskContent.events do
  'click #edit': !->
    $('#edit').editable({inlineMode: false})
    $('.froala-box').children().eq(2).remove()
