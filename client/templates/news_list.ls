Template.newsList.helpers {
    newsList: -> Users.findOne!.news
}