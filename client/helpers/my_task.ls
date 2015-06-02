Template.myTask.helpers do
  All_Tasks: ->
    # 全部
    if Session.get("_myTask_sortBy") is "All"
      if Session.get("_myTask_PublishOrApply") is "Publish"
        return AllTasks.find {createdBy:(Meteor.user().username)}
      else if Session.get("_myTask_PublishOrApply") is "Apply"
        return AllTasks.find {executant:(Meteor.user().username)}
      else
        return AllTasks.find {$or:[{createdBy:(Meteor.user().username)},{executant:(Meteor.user().username)}]}

    # 学习
    if Session.get("_myTask_sortBy") is "Study"
      if Session.get("_myTask_PublishOrApply") is "Publish"
        return AllTasks.find {createdBy:(Meteor.user().username), type: '学习'}
      else if Session.get("_myTask_PublishOrApply") is "Apply"
        return AllTasks.find {executant:(Meteor.user().username), type: '学习'}
      else
        return AllTasks.find {$or:[{createdBy:(Meteor.user().username)},{executant:(Meteor.user().username)}], type: '学习'}

    # 生活
    if Session.get("_myTask_sortBy") is "Life"
      if Session.get("_myTask_PublishOrApply") is "Publish"
        return AllTasks.find {createdBy:(Meteor.user().username), type: '生活'}
      else if Session.get("_myTask_PublishOrApply") is "Apply"
        return AllTasks.find {executant:(Meteor.user().username), type: '生活'}
      else
        return AllTasks.find {$or:[{createdBy:(Meteor.user().username)},{executant:(Meteor.user().username)}], type: '生活'}

    # 娱乐
    if Session.get("_myTask_sortBy") is "Entertainment"
      if Session.get("_myTask_PublishOrApply") is "Publish"
        return AllTasks.find {createdBy:(Meteor.user().username), type: '娱乐'}
      else if Session.get("_myTask_PublishOrApply") is "Apply"
        return AllTasks.find {executant:(Meteor.user().username), type: '娱乐'}
      else
        return AllTasks.find {$or:[{createdBy:(Meteor.user().username)},{executant:(Meteor.user().username)}], type: '娱乐'}

    # 其他
    if Session.get("_myTask_sortBy") is "Others"
      if Session.get("_myTask_PublishOrApply") is "Publish"
        return AllTasks.find {createdBy:(Meteor.user().username), type: '其他'}
      else if Session.get("_myTask_PublishOrApply") is "Apply"
        return AllTasks.find {executant:(Meteor.user().username), type: '其他'}
      else
        return AllTasks.find {$or:[{createdBy:(Meteor.user().username)},{executant:(Meteor.user().username)}], type: '其他'}

Template.myTask.events do
  'change \#option1': (event) !->
    Session.set "_myTask_sortBy", "All",
  'change \#option2': (event) !->
    Session.set "_myTask_sortBy", "Study",
  'change \#option3': (event) !->
    Session.set "_myTask_sortBy", "Life",
  'change \#option4': (event) !->
    Session.set "_myTask_sortBy", "Entertainment",
  'change \#option5': (event) !->
    Session.set "_myTask_sortBy", "Others",
  'change .publish': (event) !->
    Session.set "_myTask_PublishOrApply", "Publish",
  'change .apply': (event) !->
    Session.set "_myTask_PublishOrApply", "Apply",
