Template.taskList.helpers do
  All_Tasks: ->
    
    # 全部
    if Session.get("_home_sortBy") is "All"
      if Session.get "_isShowOverdue"
        return AllTasks.find {}
      else
        return AllTasks.find {deadline:{$gte:new Date()}}

    # 学习
    if Session.get("_home_sortBy") is "Study"
      if Session.get "_isShowOverdue"
        return AllTasks.find {type: '学习'}
      else
        return AllTasks.find {type: '学习', deadline:{$gte:new Date()}}

    # 生活
    if Session.get("_home_sortBy") is "Life"
      if Session.get "_isShowOverdue"
        return AllTasks.find {type: '生活'}
      else
        return AllTasks.find {type: '生活', deadline:{$gte:new Date()}}

    # 娱乐
    if Session.get("_home_sortBy") is "Entertainment"
      if Session.get "_isShowOverdue"
        return AllTasks.find {type: '娱乐'}
      else
        return AllTasks.find {type: '娱乐', deadline:{$gte:new Date()}}

    # 其他
    if Session.get("_home_sortBy") is "Others"
      if Session.get "_isShowOverdue"
        return AllTasks.find {type: '其他'}
      else
        return AllTasks.find {type: '其他', deadline:{$gte:new Date()}}

Template.taskList.events do
  'change .show-overdue input': !->
    Session.set "_isShowOverdue", !Session.get "_isShowOverdue"
  'change \#option1': (event) !->
    Session.set "_home_sortBy", "All",
  'change \#option2': (event) !->
    Session.set "_home_sortBy", "Study",
  'change \#option3': (event) !->
    Session.set "_home_sortBy", "Life",
  'change \#option4': (event) !->
    Session.set "_home_sortBy", "Entertainment",
  'change \#option5': (event) !->
    Session.set "_home_sortBy", "Others",