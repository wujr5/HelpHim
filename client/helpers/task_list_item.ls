Template.taskListItem.helpers do
  people: ->
    AllTasks.findOne({})
  isOverdue: (deadline) ->
    return deadline < new Date() ? true : false