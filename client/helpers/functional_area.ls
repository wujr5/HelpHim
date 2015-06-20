Template.functionalArea.helpers do
  unreadMessageNum: ->
    news = Meteor.user().news
    count = 0
    for i from 0 to news.length - 1
      if news[i].unread == true
        count++
    count
  userInfo: ->
        avatar = null
        if Meteor.user!
            avatarid = Meteor.users.findOne({_id:Meteor.userId()}).avarId
            avatar = UploadAvatar.findbyid avatarid
        avatar
  noimage: ->
        Meteor.user().avarId == null