Template.publishTask.onRendered !->
  @$('#edit').editable({inlineMode: false})
  @$('.froala-box').children().eq(2).remove()
  @$('#datetimepicker').datetimepicker {
    minDate: new Date()
    useCurrent: true
    showClear: true
  }
