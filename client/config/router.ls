Router.route '/', !->
  Session.set "_home_sortBy", "All"
  Session.set "_isShowOverdue", false
  Session.set "_Page", "home"
  @render 'home'

Router.route '/home', !->
  Session.set "_home_sortBy", "All"
  Session.set "_isShowOverdue", false
  Session.set "_Page", "home"
  @render 'home'

Router.route '/newsList', !->
  @render 'newsList'

Router.route '/oneTask/:_id',!->
  Session.set "oneTaskId", @params._id
  @render 'oneTask'

Router.route '/publishTask', !->
  @render 'publishTask'

Router.route '/myTask', !->
  Session.set "_myTask_sortBy", "All"
  Session.set "_myTask_PublishOrApply", "default"
  Session.set "_Page", "myTask"
  @render 'myTask'

Router.route '/info', !->
  Session.set "myinfo", "yep"
  @render 'info'
  