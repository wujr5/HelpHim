Template.publishTask.events do
  'focus #edit': !->
    $('#edit').editable({inlineMode: false})
    $('.froala-box').children().eq(2).remove()

# Template.publishTask.helpers do
#   showTheEditor: ->
#     $('#edit').editable({inlineMode: false})
#     'wujiarong'