Template.taskListItem.helpers do

  people: ->
    AllTasks.findOne({})

  isOverdue: (deadline) ->
    return deadline < new Date() ? true : false

  isMyTaskPage: ->
    return Session.get("_Page") == "myTask"

  GetDateDiff: (deadline) ->
    now_time = (new Date!).getTime!
    deadline_time = deadline.getTime!
    return Math.round((deadline_time - now_time)/86400000)