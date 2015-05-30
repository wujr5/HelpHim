if Meteor.isClient
  window.AllTasks = new Mongo.Collection('allTasks')
  window.Users = new Mongo.Collection('users')
else
  AllTasks = new Mongo.Collection('allTasks')
  Users = new Mongo.Collection('users')

  AllTasks.insert {
    title: '我是学霸'
    type: '学习'
    description: '我在图书馆，可以跟你一起回去'
    createBy: 'wujia'
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
    title: '我是暖男'
    type: '生活'
    description: '我可以给你送汤'
    createBy: 'wuji'
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
    title: '我是最强王者'
    type: '娱乐'
    description: '一区带你飞'
    createBy: 'wuji'
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
    title: '我是路过的'
    type: '其他'
    description: '我真的是路过的'
    createBy: 'wuji'
    createAt: '2015-5-27 15:30'
    reward: '一顿麦当劳！'
    applicants: ['zhangsan', 'lisi', 'wangwu']
    applicationReasons: ['我能在10分钟内拿给你', '我很帅', '我在图书馆，可以跟你一起回去']
    # 执行者
    executant: null
    deadline: '2015-5-27 16:00'
    contact: '13800138000'
  }

  Users.insert {
    name: 'wujiarong'
    userId: 'XXX'
    # profileImage: 'images/' + Meteor.userId() + '.png'
    news: [{type: 'applicant', content: '张三申请xxx任务', taskId: 'XXX'}]
    proficiency: 0
    credit: 0
  }