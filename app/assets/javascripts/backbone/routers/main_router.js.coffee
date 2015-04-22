 class Buggy.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'
    'projects': 'project'
    'projects/new': 'newProject'
    'projects/:id': 'showProject'
    'projects/edit/:id': 'editProject'
    'login': 'login'
    'logout': 'logout'

  initialize: ->
    @headerView = new Buggy.Views.Header()
    @contentView = new Buggy.Views.Content()

  login: ->
    @layoutViews()
    @contentView.swapMain(new Buggy.Views.Login({ model: new Buggy.Models.Login() }))

  logout: ->
    Buggy.Vent.trigger 'user:logged_out'

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
    if Buggy.currentUser.get('loggedIn')
      v = new Buggy.Views.NewProject({ model: new Buggy.Models.Project })
    else
      v = new Buggy.Views.AccessDenied()
    @contentView.swapMain v
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
