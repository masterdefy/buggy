class Buggy.Views.Project extends Backbone.View

  template: HandlebarsTemplates['project']

  events:
    'click a': 'showDetails'

  showDetails: (e) ->
    e.preventDefault()
    Buggy.Vent.trigger 'project:show', @model

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
