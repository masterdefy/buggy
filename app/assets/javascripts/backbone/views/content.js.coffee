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

  projectShow: (model) ->
    @swapMain new Buggy.Views.ProjectDetails({ model: model })

  swapMainToEmpty: ->
    @swapMain new Buggy.Views.Empty()
    Backbone.history.navigate '/projects'

  swapToNewProject: ->
    @swapMain new Buggy.Views.NewProject({ model: new Buggy.Models.Project })
    Backbone.history.navigate '/projects/new'

  swapMain: (v) ->
    @changeCurrentMainView v
    @$('#main-area').html @currentMainView.render().el

  changeCurrentMainView: (v) ->
    @currentMainView.remove() if @currentMainView
    @currentMainView = v

  swapSide: (v) ->
    @changeCurrentSideView v
    @$('#sidebar-area').html @currentSideView.render().el

  changeCurrentSideView: (v) ->
    @currentSideView.remove() if @currentSideView
    @currentSideView = v
