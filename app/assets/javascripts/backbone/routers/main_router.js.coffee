class Buggy.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'

  initialize: ->
    @headerView = new Buggy.Views.Header()
    @contentView = new Buggy.Views.Content()

  index: ->
    $('#header').html @headerView.render().el
    $('#content').html @contentView.render().el
