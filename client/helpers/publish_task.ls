Template.publishTask.onRendered !->

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
    minDate: new Date()
    useCurrent: true
    showClear: true
  }
  
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
        createdBy: Meteor.user!.username
        createdAt: Date.now!
        reward: ev.target.reward.value
        applicationReasons: []
        executant: null
        deadline: new Date ev.target.deadline.value
        contact: ev.target.contact.value
        state: '无执行者且未完成'
    AllTasks.insert task

#  富文本编辑器内容展示方法

#  eg:

#  div.froala-view#showbox

#  task = AllTasks.find().fetch()[1]

#  $('#showbox').html(task.description)
