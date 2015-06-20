if Meteor.isClient
  Accounts.ui.config {
    passwordSignupFields: 'USERNAME_AND_EMAIL'
  }
else
  Accounts.onCreateUser (options, user)->
    extra = {
      profileImage: '/images/hd.jpg'
      news: []
      proficiency : 0
      credit : 0
      myApplications: []
      avarId: null
    }
    user <<< extra
    if options.profile
      user.profile = options.profile
    user