Template.functionalArea.helpers do
  unreadMessageNum: ->
    news = Meteor.user().news
    count = 0
    for i from 0 to news.length - 1
      if news[i].unread == true
        count++
    count

