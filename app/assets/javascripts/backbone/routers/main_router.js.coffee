class Buggy.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'
    'projects': 'project'
    'projects/new': 'newProject'
    'projects/:id': 'showProject'
    'projects/edit/:id': 'editProject'

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

  showProject: (id) ->
    @layoutViews()
    @contentView.swapSide new Buggy.Views.Projects({ collection: new Buggy.Collections.Projects })
    m = new Buggy.Models.Project({ id: id })
    @contentView.swapMain new Buggy.Views.ProjectDetails({ model: m })

  editProject: (id) ->
    @layoutViews()
    @contentView.swapSide new Buggy.Views.Projects({ collection: new Buggy.Collections.Projects })
    m = new Buggy.Models.Project({ id: id })
    @contentView.swapMain new Buggy.Views.NewProject({ model: m })

  layoutViews: ->
    $('#header').html @headerView.render().el
    $('#content').html @contentView.render().el
