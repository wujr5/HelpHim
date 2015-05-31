Template.taskList.helpers do
  All_Tasks: ->
    if Session.get("sortBy") is "All"
      return AllTasks.find {}
    if Session.get("sortBy") is "Study"
      return AllTasks.find {type: '学习'}
    if Session.get("sortBy") is "Life"
      return AllTasks.find {type: '生活'}
    if Session.get("sortBy") is "Entertainment"
      return AllTasks.find {type: '娱乐'}
    if Session.get("sortBy") is "Others"
      return AllTasks.find {type: '其他'}
    AllTasks.find {}

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
    