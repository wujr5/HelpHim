if Meteor.isClient
  window.AllTasks = new Mongo.Collection('allTasks')
  window.AllUsers = new Mongo.Collection('allUsers')
else
  AllTasks = new Mongo.Collection('allTasks')
  AllUsers = new Mongo.Collection('allUsers')

  if AllTasks.find().count() == 0
    AllTasks.insert {
      title: '突然下大雨，求带雨伞'
      type: '生活'
      description: '天突降大雨，被困图书馆，赶时间回宿舍，求好心人帮忙带伞，重酬!'
      createBy: 'wujiarong'
      createAt: new Date()
      reward: '一顿麦当劳！'
      applicants: ['zhangsan', 'lisi', 'wangwu']
      applicationReasons: [{zhangsan: '我能在10分钟内拿给你'}, {lisi: '我很帅'}, {wangwu: '我在图书馆，可以跟你一起回去'}]
      # 执行者
      executant: null
      deadline: new Date()
      contact: '13800138000'
    }

    AllTasks.insert {
      title: '突然下大雨，求带雨伞'
      type: '生活'
      description: '天突降大雨，被困图书馆，赶时间回宿舍，求好心人帮忙带伞，重酬!'
      createBy: 'wujiarong'
      createAt: new Date()
      reward: '一顿麦当劳！'
      applicants: ['zhangsan', 'lisi', 'wangwu']
      applicationReasons: [{zhangsan: '我能在10分钟内拿给你'}, {lisi: '我很帅'}, {wangwu: '我在图书馆，可以跟你一起回去'}]
      # 执行者
      executant: null
      deadline: new Date()
      contact: '13800138000'
    }

    Users.insert {
      name: 'wujiarong'
      userId: 'XXX'
      # profileImage: 'images/' + Meteor.userId() + '.png'
      news: [{type: 'applicant', taskId: 'XXX', unread: true}]
      proficiency: 0
      credit: 0
    }