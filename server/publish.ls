Meteor.publish "userData", ->
  Meteor.users.find {}, {fields: {'profileImage': 1, 'news': 1, 'totalProficiency': 1, 'totalCredit': 1, 'myApplications': 1, 'avarId': 1, 'applyTasksTimes': 1, 'compliteTasksTimes': 1}}
  # if true
  #   Meteor.users.find {_id: @userId}, {fields: {'profileImage': 1, 'news': 1, 'proficiency': 1, 'credit': 1}}
  # else
  #   this.ready!
  #   return
