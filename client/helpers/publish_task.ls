Template.publishTask.events do
  'focus #edit': !->
    $('#edit').editable({inlineMode: false})

# Template.publishTask.helpers do
#   showTheEditor: ->
#     $('#edit').editable({inlineMode: false})
#     'wujiarong'