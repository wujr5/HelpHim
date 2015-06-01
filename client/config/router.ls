Router.route '/', !->
  Session.set "_home_sortBy", "All"
  Session.set "_isShowOverdue", false
  @render 'home'

Router.route '/home', !->
  Session.set "_home_sortBy", "All"
  Session.set "_isShowOverdue", false
  @render 'home'

Router.route '/newsList', !->
  @render 'newsList'

Router.route '/oneTask/:_id', !->
  @render 'oneTask', {data: -> AllTasks.findOne({_id: @params._id})}

Router.route '/publishTask', !->
  @render 'publishTask'

Router.route '/myTask', !->
  Session.set "_myTask_sortBy", "All"
  Session.set "_myTask_PublishOrApply", "default"
  @render 'myTask'
