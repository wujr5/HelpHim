Template.newsListItem.helpers do
  title: -> AllTasks.findOne {_id: this.taskId},{title: 1} .title
  
  content: ->
    content = {}
    # 对于发布者的消息类型
    if @type is 'apply-task' then
      content.style = "info"
      content.info = "您发布的任务有新的申请哦"

    # 对于申请者的消息类型
    else if @type is 'apply-result'
      target = AllTasks.findOne({_id: this.taskId}).executant

      if target is Meteor.user!.username
        content.style = "success"
        content.info = "您的申请已通过,可以去执行任务了"
      else
        content.style = "danger"
        content.info = "对不起，您的申请没有通过"

    # 系统消息
    else if @type is "system-info"
      content.title = "系统消息"
      content.style = "primary"
      content.info = @content

    # 请求发布者确认消息
    else if @type is "complete-confirm"
      content.style = "success"
      content.info = "您的任务已经被完成，请确认"

    content
  
  unread:-> @unread

Template.newsListItem.events do
  'click .detail': !->
    if @unread
      allNews = Meteor.user().news;

      console.log @newsId

      for i from 0 to allNews.length - 1
        if allNews[i].newsId.toString! == this.newsId.toString!
          allNews[i].unread = false
          Meteor.users.update({_id: Meteor.userId()}, {$set: {news: allNews}})
          break
