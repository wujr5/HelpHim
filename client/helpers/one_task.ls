# Template.oneTaskContent.onRendered !->
#   @$('#edit').editable({inlineMode: false})
#   @$('.froala-box').children().eq(2).remove()

Template.oneTaskContent.helpers do
  task: ->
    _id = Session.get 'oneTaskId'
    AllTasks.findOne {_id: _id}

  isExecutant: (task, name, role)->
    if role == 'current-user'
      Meteor.user().username == name
    else if role == 'applicant'
      task.executant == name

  isSelf: (name)->
    console.log name
    Meteor.user().username == name

  isPublisher: (task)->
    Meteor.user().username == task.publisher and task.executant == null

  isAdmin: ->
    Meteor.user().username == 'admin'

  canBeApply: (task)->    
    if task.executant == null and task.deadline > (new Date()) and task.createdBy != Meteor.user().username
      flag = true
      task.applicantsAndReasons.forEach (each)!->
        if each.name == Meteor.user().username
          flag := false
      flag
    else
      false

  userImageSrc: (name)->
    '/images/hd.jpg'
    # console.log Meteor.users.findOne({username: name}).profileImage
    # Meteor.users.findOne({username: name}).profileImage

Template.oneTaskContent.events do
  'click #edit': !->
    $('#edit').editable({inlineMode: false})
    $('.froala-box').children().eq(2).remove()
