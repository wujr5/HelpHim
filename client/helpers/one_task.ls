Template.oneTaskContent.onRendered !->
  @$('#edit').editable({inlineMode: false})
  @$('.froala-box').children().eq(2).remove()

Template.oneTaskContent.helpers do
  task: ->
    AllTasks.findOne!