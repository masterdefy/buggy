class Buggy.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'
    'projects': 'project'
    'projects/new': 'newProject'

  initialize: ->
    @headerView = new Buggy.Views.Header()
    @contentView = new Buggy.Views.Content()

  index: ->
    @layoutViews()
    @contentView.swapMain new Buggy.Views.Ads()
    @contentView.swapSide new Buggy.Views.News()

  project: ->
    @layoutViews()
    @contentView.swapMain new Buggy.Views.Empty()
    @contentView.swapSide new Buggy.Views.Projects({ collection: new Buggy.Collections.Projects })

  newProject: ->
    @layoutViews()
    @contentView.swapMain new Buggy.Views.NewProject({ model: new Buggy.Models.Project })
    @contentView.swapSide new Buggy.Views.Projects({ collection: new Buggy.Collections.Projects })

  layoutViews: ->
    $('#header').html @headerView.render().el
    $('#content').html @contentView.render().el
