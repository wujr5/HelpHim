if Meteor.isClient
  Accounts.ui.config {
    passwordSignupFields: 'USERNAME_AND_EMAIL'
  }
else
  Accounts.onCreateUser (options, user)->
    extra = {
      profileImage: '/images/hd.jpg'
      news: [{type: 'applicant', content: '张三申请xxx任务', taskId: 'XXX'}]
      proficiency : 0
      credit : 0
    }
    user <<< extra
    if options.profile
      user.profile = options.profile;
    user