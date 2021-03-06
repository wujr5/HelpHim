Template.info.helpers do
  user: ->
    user-original = Meteor.user!
    user-view = {}
    user-view.username = user-original.username
    user-view.email = user-original.emails[0].address
    if user-original.compliteTasksTimes is 0
      user-view.proficiency = 0
    else
      user-view.proficiency = user-original.totalProficiency / user-original.compliteTasksTimes

    user-view

  infoState: ->
    if Session.get("myinfo") is "yep"
      infoState = true
    else
      infoState = false

  nochange: ->
    if Session.get("myinfo") is "yep"
      true
    else
      false
  userInfo: ->
        avatar = null
        if Meteor.user!
            avatarid = Meteor.users.findOne({_id:Meteor.userId()}).avarId
            avatar = UploadAvatar.findbyid avatarid
        avatar
  noimage: ->
        Meteor.user().avarId == null

Template.info.events do
  'change \#option': (event) !->
    Session.set "myinfo", "nope" 
  'change \#myimage': (e)!->

    e.preventDefault!

    if typeof FileReader is undefined
      alert '抱歉，你的浏览器不支持预览功能'

    reader = new FileReader()
    file = e.target.files[0]
    reader.readAsDataURL file
    reader.onload = (e)!->
      $ '#imagename' .attr 'src', reader.result
  "submit form": (e) ->
    e.prevent-default!
    avatar = $(e.target).find('[name=avatar]')[0].files
    UploadAvatar.insert avatar
    Router.go '/home'

