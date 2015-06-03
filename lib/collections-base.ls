
# if Meteor.isClient
#   window.AllTasks = new Mongo.Collection('allTasks')
# else
#   AllTasks = new Mongo.Collection('allTasks')

#   if AllTasks.find().count() == 0
#     AllTasks.insert {
#       title: '突然下大雨，求带雨伞'
#       type: '生活'
#       description: '天突降大雨，被困图书馆，赶时间回宿舍，求好心人帮忙带伞，重酬!'
#       createdBy: '吴家荣'
#       createdAt: new Date()
#       reward: '一顿麦当劳！'
#       applicantsAndReasons: [{name: '张三元', reason: '我能在10分钟内拿给你'}, {name: '李四元', reason: '我很帅'}, {name: '王五元', reason: '我在图书馆，可以跟你一起回去'}]
#       executant: '张三元'
#       deadline: new Date('06/19/2015 10:32 AM')
#       contact: '13800138000'
#       state: '待完成' # state: 三种状态：已完成，申请完成，待完成，未完成，已取消
#     }

# 用来测试的用户
# admin 0@qq.com 111111
# 吴家荣 1@qq.com 111111
# 张三元 2@qq.com 111111
# 李四元 3@qq.com 111111
# 王五元 4@qq.com 111111
# 李六元 5@qq.com 111111
