Meteor.publish "userData", ->
  if @userId
    Meteor.users.find {_id: @userId}, {fields: {'profileImage': 1, 'news': 1, 'proficiency': 1, 'credit': 1}}
  else
    this.ready!
    return
