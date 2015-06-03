Template.newsListItem.helpers {
    title: -> AllTasks.findOne {_id: this.taskId},{title: 1} .title
    content: ->
        content = {}
        if @type is 'apply-task' then
            content.style = "info"
            content.info = "有"+AllTasks.findOne {_id: this.taskId}, {applicants: 1} .applicants.join(',')+"等人申请"
        else if @type is 'apply-result'
            target = AllTasks.findOne  {_id: this.taskId}, {executant: 1} .executant
            if target isnt null
                if target is 'XXX' then#for testing 之后替换为Meteor.user!.name/_id
                    content.style = "success"
                    content.info = "您的申请已通过,可以去执行任务了"
                else
                    content.style = "danger"
                    content.info = "对不起，您的申请没有通过"
        else if @type is "system-info"
            content.title = "系统消息"
            content.style = "primary"
            content.info = @content
        else        #if @type is "complete-confirm"
            content.style = "success"
            content.info = "您的任务已经被完成，请确认"
        content
    unread:-> @unread
}
