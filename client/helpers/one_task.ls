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
    Meteor.user().username == name

  isPublisher: (task)->
    Meteor.user().username == task.createdBy and task.executant == null

  isAdmin: ->
    Meteor.user().username == 'admin'

  canBeApply: (task)->
    if task.executant == null and task.deadline > (new Date()) and task.createdBy != Meteor.user().username
      flag = true
      for i from 0 to task.applicantsAndReasons.length - 1
        each = task.applicantsAndReasons[i]
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

  'click .select-excutant': !->
    AllTasks.update({_id: Session.get('oneTaskId')}, {$set: {executant: this.name}})

  'click .apply-task': !->
    if $('.apply-reason')[0].value is ''
      $('.apply-task-warn').remove-class 'sr-only'
    else
      apply-reason = $('.froala-view.froala-element').html()
      AllTasks.update({_id: Session.get('oneTaskId')}, {$push: applicantsAndReasons: {name: Meteor.user().username, reason: apply-reason}})

  'click .froala-box': !->
    $('.apply-task-warn').add-class 'sr-only'

  'click .delete-task': !->
    _id = Session.get 'oneTaskId'
    AllTasks.remove _id
    Router.go '/home'
