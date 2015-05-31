if Meteor.isClient
  window.AllTasks = new Mongo.Collection('allTasks')
  window.Users = new Mongo.Collection('users')
else
  AllTasks = new Mongo.Collection('allTasks')
  Users = new Mongo.Collection('users')

  if (AllTasks.find!.count() < 4)
    AllTasks.insert {
      _id: 'YYY'              #for testing
      title: '突然下大雨，求带雨伞'
      type: '生活'
      description: '天突降大雨，被困图书馆，赶时间回宿舍，求好心人帮忙带伞，重酬!'
      createBy: 'wujiarong'
      createAt: '2015-5-27 15:30'
      reward: '一顿麦当劳！'
      applicants: ['zhangsan', 'lisi', 'wangwu']
      applicationReasons: ['我能在10分钟内拿给你', '我很帅', '我在图书馆，可以跟你一起回去']
      # 执行者
      executant: null
      deadline: '2015-5-27 16:00'
      contact: '13800138000'
    }
    AllTasks.insert {
      _id: 'AAA'              #for testing
      title: '突然下大雨，求带雨伞'
      type: '生活'
      description: '天突降大雨，被困图书馆，赶时间回宿舍，求好心人帮忙带伞，重酬!'
      createBy: 'wujiarong'
      createAt: '2015-5-27 15:30'
      reward: '一顿麦当劳！'
      applicants: ['zhangsan', 'lisi', 'wangwu']
      applicationReasons: ['我能在10分钟内拿给你', '我很帅', '我在图书馆，可以跟你一起回去']
      # 执行者
      executant: 'XXX'
      deadline: '2015-5-27 16:00'
      contact: '13800138000'
    }
    AllTasks.insert {
      _id: 'BBB'              #for testing
      title: '突然下大雨，求带雨伞'
      type: '生活'
      description: '天突降大雨，被困图书馆，赶时间回宿舍，求好心人帮忙带伞，重酬!'
      createBy: 'wujiarong'
      createAt: '2015-5-27 15:30'
      reward: '一顿麦当劳！'
      applicants: ['zhangsan', 'lisi', 'wangwu']
      applicationReasons: ['我能在10分钟内拿给你', '我很帅', '我在图书馆，可以跟你一起回去']
      # 执行者
      executant: 'GGG'
      deadline: '2015-5-27 16:00'
      contact: '13800138000'
    }
    AllTasks.insert {
      _id: 'CCC'              #for testing
      title: '突然下大雨，求带雨伞'
      type: '生活'
      description: '天突降大雨，被困图书馆，赶时间回宿舍，求好心人帮忙带伞，重酬!'
      createBy: 'wujiarong'
      createAt: '2015-5-27 15:30'
      reward: '一顿麦当劳！'
      applicants: ['zhangsan', 'lisi', 'wangwu']
      applicationReasons: ['我能在10分钟内拿给你', '我很帅', '我在图书馆，可以跟你一起回去']
      # 执行者
      executant: 'XXX'
      deadline: '2015-5-27 16:00'
      contact: '13800138000'
    }


    Users.insert {
      name: 'wujiarong'
      userId: 'XXX'
      # profileImage: 'images/' + Meteor.userId() + '.png'
      news: [{type: 'apply-task', taskId: 'YYY', unread: true, content: null},
            {type: 'apply-result', taskId: 'AAA', unread: false, content: null}
            {type: 'apply-result', taskId: 'BBB', unread: true, content: null}
            {type: 'system-info', taskId: null, unread: false, content: "testing:)"}
            {type: 'complete-confirm', taskId: 'CCC', unread: false, content: null}]
    }