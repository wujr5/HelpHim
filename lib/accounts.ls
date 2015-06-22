if Meteor.isClient
  Accounts.ui.config {
    passwordSignupFields: 'USERNAME_AND_EMAIL'
  }
else
  Accounts.onCreateUser (options, user)->
    extra = {
      profileImage: '/images/hd.png'
      news: []
      myApplications: []
      avarId: null
      applyTasksTimes: 0
      compliteTasksTimes: 0
      totalProficiency : 0
      totalCredit : 0
    }
    user <<< extra
    if options.profile
      user.profile = options.profile
    user