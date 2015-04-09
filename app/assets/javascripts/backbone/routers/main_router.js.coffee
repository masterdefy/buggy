class Buggy.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'
    'projects': 'project'

  initialize: ->
    @headerView = new Buggy.Views.Header()
    @contentView = new Buggy.Views.Content()

  index: ->
    @layoutViews()

  project: ->
    @layoutViews()

  layoutViews: ->
    $('#header').html @headerView.render().el
    $('#content').html @contentView.render().el


