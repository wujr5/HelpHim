
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
#       applicantsAndReasons: [{name: '张三元', reason: '我能在10分钟内拿给你', taskId: this._id}, {name: '李四元', reason: '我很帅',  taskId: this._id}, {name: '王五元', reason: '我在图书馆，可以跟你一起回去', taskId: this._id}]
#       executant: '张三元'
#       deadline: new Date('06/19/2015 10:32 AM')
#       contact: '13800138000'
#       state: '待完成' # state: 三种状态：已完成，申请完成，待完成，未完成
#     }
#     AllTasks.insert {
#       title: '新生报到，请求搬行李'
#       type: '生活'
#       description: '新到中大，很多行李，希望有人帮忙搬一下'
#       createdBy: '李六元'
#       createdAt: new Date()
#       reward: '交个朋友'
#       applicantsAndReasons: [{name: '张三元', reason: '我愿意帮忙', taskId: "jvYXmhooGxX2YkWDp"}, {name: '李四元', reason: '很乐意', taskId: "jvYXmhooGxX2YkWDp"}, {name: '王五元', reason: '让我帮你吧', taskId: "jvYXmhooGxX2YkWDp"}]
#       executant: null
#       deadline: new Date('06/18/2015 8:44 PM')
#       contact: '10086'
#       state: '未完成'
#     }
#     AllTasks.insert {
#       title: '电脑崩了，求重装系统'
#       type: '娱乐'
#       description: '电脑崩溃，已经折腾很久了，想人帮忙重新装系统'
#       createdBy: '张三元'
#       createdAt: new Date()
#       reward: '20元'
#       applicantsAndReasons: [{name: '李六元', reason: '我是软院的，很厉害的哦', taskId: "nChQR84kBvsRJHeES"}, {name: '李四元', reason: '小意思，10分钟搞定', taskId: "nChQR84kBvsRJHeES"}, {name: '王五元', reason: '我想试试', taskId: "nChQR84kBvsRJHeES"}]
#       executant: null
#       deadline: new Date('06/24/2015 8:44 PM')
#       contact: '13800138000'
#       state: '未完成'
#     }

# # 用来测试的用户
# # admin 0@qq.com 111111
# # 吴家荣 1@qq.com 111111
# # 张三元 2@qq.com 111111
# # 李四元 3@qq.com 111111
# # 王五元 4@qq.com 111111
# # 李六元 5@qq.com 111111
