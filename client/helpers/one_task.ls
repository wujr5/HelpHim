Template.oneTaskContent.onRendered !->
  @$('#edit').editable({inlineMode: false})
  @$('.froala-box').children().eq(2).remove()

Template.oneTaskContent.helpers do
  task: ->
    AllTasks.findOne!
  isExecutant: (executant)->
    Meteor.user().username == executant
  isPublisher: (publisher)->
    Meteor.user().username == publisher
  isAdmin: ->
    Meteor.user().username == 'admin'
  canBeApply: (task)->
    if task.executant == null and task.deadline > (new Date())
      return true
    false