Template.oneTaskContent.onRendered !->
  $('#edit').on 'editable.getHTML', (e, editor, html)!->
    $ '#edit' .html html
  $('#edit').editable({
    inlineMode: false,
    useFrTag: true,
    toolbarFixed: false,
    placeholder: 'Please describe your mission in detail here...',
    buttons: ['bold', 'italic', 'underline', 'strikeThrough', 'fontSize', 'fontFamily', 'color', 'formatBlock', 'blockStyle', 'align', 'insertOrderedList', 'insertUnorderedList', 'outdent', 'indent', 'createLink', 'insertImage', 'insertVideo', 'uploadFile', 'table', 'undo', 'redo', 'html', 'fullscreen']
    })
  $('.froala-box').children().eq(2).remove()


Template.oneTaskContent.helpers do
  task: ->
    _id = Session.get 'oneTaskId'
    AllTasks.findOne {_id: _id}

  isExecutant: (task, name, role)->
    if role == 'current-user'
      Meteor.user().username == name
    else if role == 'applicant'
      task.executant == name
    else if role == 'current-user-or-publisher'
      Meteor.user().username == name or task.createdBy == Meteor.user().username

  isSelf: (name)->
    Meteor.user().username == name

  isPublisher: (task, type)->
    if type == 'select-excutant'
      Meteor.user().username == task.createdBy and task.executant == null
    else if type == 'cancle-publish-task'
      (task.state == '未完成' or task.state == '待完成' or task.state == '申请完成') and task.state != '已完成' and task.createdBy == Meteor.user().username
    else if type == 're-publish-task'
      task.state == '已取消' and task.deadline > (new Date()) and task.createdBy == Meteor.user().username

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

  getCredit: (name)->
    Meteor.users.findOne({username: name}).credit

  getProficiency: (name)->
    Meteor.users.findOne({username: name}).proficiency

  userImageSrc: (name)->
    '/images/hd.jpg'
    # console.log Meteor.users.findOne({username: name}).profileImage
    # Meteor.users.findOne({username: name}).profileImage

Template.oneTaskContent.events do
  # 选择执行者
  'click .select-excutant': !->
    AllTasks.update({_id: Session.get('oneTaskId')}, {$set: {executant: this.name, state: '待完成'}})

    applicantsAndReasons = AllTasks.findOne({_id: Session.get('oneTaskId')}).applicantsAndReasons

    for i from 0 to applicantsAndReasons.length - 1

      userId = Meteor.users.findOne({username: applicantsAndReasons[i].name})._id
      Meteor.users.update({_id: userId}, {$push: news: {type: 'apply-result', content: null, taskId: Session.get('oneTaskId'), unread: true, newsId: new Date()}}, true)

  # 申请任务
  'click .apply-task': !->
    apply-reason = $('.froala-view.froala-element').html()
    if apply-reason is '<p><br></p>'
      $('.apply-task-warn').remove-class 'sr-only'
    else
      AllTasks.update({_id: Session.get('oneTaskId')}, {$push: applicantsAndReasons: {name: Meteor.user().username, reason: apply-reason}})

      userId = Meteor.users.findOne({username: AllTasks.findOne({_id: Session.get('oneTaskId')}).createdBy})._id

      Meteor.users.update({_id: userId}, {$push: news: {type: 'apply-task', content: null, taskId: Session.get('oneTaskId'), unread: true, newsId: new Date()}})

      Meteor.users.update({_id: Meteor.userId()}, {$push: myApplications: {taskId: Session.get('oneTaskId')}})

  # 隐藏关于没有填写申请理由的提示信息
  'click .froala-box': !->
    $('.apply-task-warn').add-class 'sr-only'

  # 删除任务
  'click .delete-task': !->
    _id = Session.get 'oneTaskId'
    AllTasks.remove _id
    Router.go '/home'

  # 取消发布
  'click .cancel-publish': !->
    _id = Session.get 'oneTaskId'
    AllTasks.update {_id: _id}, {$set: {state: '已取消', executant: null, applicantsAndReasons: []}}
    Router.go '/home'

  # 重新发布
  'click .re-publish': !->
    _id = Session.get 'oneTaskId'
    AllTasks.update {_id: _id}, {$set: {state: '未完成'}}
    Router.go '/home'

  'click .apply-complete': !->
    AllTasks.update {_id: Session.get('oneTaskId')}, {$set: {state: '申请完成'}}

    Meteor.users.update({_id: Meteor.userId()}, {$push: news: {type: 'complete-confirm', content: null, taskId: Session.get('oneTaskId'), unread: true, newsId: new Date()}})

    Router.go '/home'

