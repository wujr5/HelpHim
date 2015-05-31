Template.publishTask.onRendered !->
<<<<<<< HEAD

  $('#edit').on 'editable.getHTML', (e, editor, html)!->
    $ '#edit' .html html
  $('#edit').editable({
    inlineMode: false,
    useFrTag: true,
    height: 200,
    toolbarFixed: false,
    placeholder: 'Please describe your mission in detail here...',
    buttons: ['bold', 'italic', 'underline', 'strikeThrough', 'fontSize', 'fontFamily', 'color', 'formatBlock', 'blockStyle', 'align', 'insertOrderedList', 'insertUnorderedList', 'outdent', 'indent', 'createLink', 'insertImage', 'insertVideo', 'uploadFile', 'table', 'undo', 'redo', 'html', 'fullscreen']
    })
  $('.froala-box').children().eq(2).remove()

  $('#datetimepicker').datetimepicker {
=======
  @$('#edit').editable({inlineMode: false})
  @$('.froala-box').children().eq(2).remove()
  @$('#datetimepicker').datetimepicker {
>>>>>>> 76a64301b0bcfed2b3c27f82ee98967291011a3b
    minDate: new Date()
    useCurrent: true
    showClear: true
  }
<<<<<<< HEAD
  
  $ '#datetimepicker input[type="text"]' .each !->
    $ this .bind 'focusout', !->
      new-date = new Date this.value
      if new-date < Date.now!
        $ this .parents '.textbox' .addClass 'has-error'
        $ '.form-horizontal button' .attr 'disabled', true
        $ this .focus!
      else
        $ this .parents '.textbox' .removeClass 'has-error'
        $ '.form-horizontal button' .attr 'disabled', false

  $ '.inputText' .each !->
    $ this .bind 'focusout', !->
      if (this.value.replace /\s/g, "" .length == 0)
        $ this .parents '.textbox' .addClass 'has-error'
        $ '.form-horizontal button' .attr 'disabled', true
        $ this .focus!
      else
        $ this .parents '.textbox' .removeClass 'has-error'
        $ '.form-horizontal button' .attr 'disabled', false

Template.publishTask.events do
  'submit': (ev, tpl)->
    ev.prevent-default!
    task =
      * title: ev.target.title.value
        type: ev.target.taskType.value
        description: ev.target.description.value
        createBy: Meteor.user!.username
        createAt: Date.now!
        reward: ev.target.reward.value
        applicants: null
        applicationReasons: null
        executant: null
        deadline: new Date ev.target.deadline.value
        contact: ev.target.contact.value
    AllTasks.insert task
=======
>>>>>>> 76a64301b0bcfed2b3c27f82ee98967291011a3b
