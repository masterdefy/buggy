class Buggy.Views.Project extends Backbone.View

  template: HandlebarsTemplates['project']

  events:
    'click a': 'showDetails'

  initialize: ->
    @listenTo @model, 'destroy', @remove
    @listenTo @model, 'change:name', @render

  showDetails: (e) ->
    e.preventDefault()
    Buggy.Vent.trigger 'project:show', @model
    Backbone.history.navigate 'projects/' + @model.id

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
