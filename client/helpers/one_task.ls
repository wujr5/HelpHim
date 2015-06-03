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

  isPublisher: (task, type)->
    if type == 'select-excutant'
      Meteor.user().username == task.createdBy and task.executant == null
    else if type == 'cancle-publish-task'
      (task.state == '未完成' or task.state == '待完成' or task.state == '申请完成') and task.state != '已完成'
    else if type == 're-publish-task'
      task.state == '已取消' and task.deadline > (new Date())

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

  'click .cancel-publish': !->
    _id = Session.get 'oneTaskId'
    AllTasks.update {_id: _id}, {$set: {state: '已取消', executant: null, applicantsAndReasons: []}}
    Router.go '/home'

  'click .re-publish': !->
    _id = Session.get 'oneTaskId'
    AllTasks.update {_id: _id}, {$set: {state: '未完成'}}
    Router.go '/home'
