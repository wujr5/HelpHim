Template.taskList.helpers do
  All_Tasks: ->

    # 全部
    if Session.get("sortBy") is "All"
      if Session.get("isShowOverdue")
        return AllTasks.find {}
      else
        return AllTasks.find {deadline:{$gte:new Date()}}

    # 学习
    if Session.get("sortBy") is "Study"
      if Session.get("isShowOverdue")
        return AllTasks.find {type: '学习'}
      else
        return AllTasks.find {type: '学习', deadline:{$gte:new Date()}}

    # 生活
    if Session.get("sortBy") is "Life"
      if Session.get("isShowOverdue")
        return AllTasks.find {type: '生活'}
      else
        return AllTasks.find {type: '生活', deadline:{$gte:new Date()}}

    # 娱乐
    if Session.get("sortBy") is "Entertainment"
      if Session.get("isShowOverdue")
        return AllTasks.find {type: '娱乐'}
      else
        return AllTasks.find {type: '娱乐', deadline:{$gte:new Date()}}

    # 其他
    if Session.get("sortBy") is "Others"
      if Session.get("isShowOverdue")
        return AllTasks.find {type: '其他'}
      else
        return AllTasks.find {type: '其他', deadline:{$gte:new Date()}}

    # 初始化
    Session.set "isShowOverdue", false
    Session.set "sortBy", "All"
    AllTasks.find {deadline:{$gte:new Date()}}

Template.taskList.events do
  'change .show-overdue input': !->
    Session.set "isShowOverdue", !Session.get "isShowOverdue"

Template.sortBy.events do
  'change \#option1': (event) !->
    Session.set "sortBy", "All",
  'change \#option2': (event) !->
    Session.set "sortBy", "Study",
  'change \#option3': (event) !->
    Session.set "sortBy", "Life",
  'change \#option4': (event) !->
    Session.set "sortBy", "Entertainment",
  'change \#option5': (event) !->
    Session.set "sortBy", "Others"
