Template.taskListItem.helpers do
  people: ->
    AllTasks.findOne({})
  isOverdue: (deadline) ->
    if deadline < new Date()
      return true
    else
      return false