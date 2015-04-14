class Buggy.Views.Projects extends Backbone.View

  template: HandlebarsTemplates['projects']

  events:
    'click a.btn': 'newProject'

  newProject: ->

  initialize: ->
    @listenTo @collection, "reset", @render
    @listenTo Buggy.Vent, 'project:create', @addToCollection
    @listenTo @collection, 'add', @renderProject
    @collection.fetch({ reset: true })

  addToCollection: (model) ->
    @collection.add model

  render: ->
    @$el.html @template
    @collection.forEach @renderProject, @
    @

  renderProject: (model) ->
    v = new Buggy.Views.Project({ model: model })
    @$('ul').append(v.render().el)
