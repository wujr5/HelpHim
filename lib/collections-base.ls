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
      applicationReasons: [{name: 'zhangsan', reason: '我能在10分钟内拿给你'}, {name: 'lisi', reason: '我很帅'}, {name: 'wangwu', reason: '我在图书馆，可以跟你一起回去'}]
      executant: null
      deadline: new Date()
      contact: '13800138000'
    }

  if AllUsers.find().count() == 0
    AllUsers.insert {
      name: 'wujiarong'
      userId: 'XXX'
      news: [{type: 'applicant', content: '张三申请xxx任务', taskId: 'XXX'}]
      proficiency: 0
      credit: 0
    }