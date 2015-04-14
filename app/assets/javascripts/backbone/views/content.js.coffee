class Buggy.Views.Content extends Backbone.View

  className: "row"

  template: HandlebarsTemplates['content']

  render: ->
    @$el.html @template
    @

  initialize: ->
    @listenTo Buggy.Vent, 'project:create', @swapMainToEmpty

  swapMainToEmpty: ->
    @swapMain new Buggy.Views.Empty()
    Backbone.history.navigate '/projects'

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
