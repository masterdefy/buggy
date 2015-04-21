class Buggy.Views.Content extends Backbone.View

  className: "row"

  template: HandlebarsTemplates['content']

  render: ->
    @$el.html @template
    @

  initialize: ->
    @listenTo Buggy.Vent, 'project:create', @swapMainToEmpty
    @listenTo Buggy.Vent, 'project:new', @swapToNewProject
    @listenTo Buggy.Vent, 'project:show', @projectShow
    @listenTo Buggy.Vent, 'project:destroy', @swapMainToEmpty
    @listenTo Buggy.Vent, 'project:edit', @editProject
    @listenTo Buggy.Vent, 'user:logged_in', @swapMainToEmpty

  editProject: (model) ->
    @swapMain new Buggy.Views.NewProject({ model: model })
    Backbone.history.navigate 'projects/edit/' + model.id

  projectShow: (model) ->
    @swapMain new Buggy.Views.ProjectDetails({ model: model })

  swapMainToEmpty: ->
    @swapMain new Buggy.Views.Empty()

  swapToNewProject: ->
    @swapMain new Buggy.Views.NewProject({ model: new Buggy.Models.Project })
    Backbone.history.navigate '/projects/new'

  swapMain: (v) ->
    @changeCurrentMainView v
    @$('#main-area').html @currentMainView.render().el

  changeCurrentMainView: (v) ->
    @currentMainView.leave() if @currentMainView
    @currentMainView = v

  swapSide: (v) ->
    @changeCurrentSideView v
    @$('#sidebar-area').html @currentSideView.render().el

  changeCurrentSideView: (v) ->
    @currentSideView.leave() if @currentSideView
    @currentSideView = v
