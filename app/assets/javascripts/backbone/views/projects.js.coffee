class Buggy.Views.Projects extends Backbone.View

  template: HandlebarsTemplates['projects']

  events:
    'click a.btn': 'newProject'

  initialize: ->
    @childViews = []
    @listenTo @collection, "reset", @render
    @listenTo Buggy.Vent, 'project:create', @addToCollection
    @listenTo @collection, 'add', @renderProject
    @collection.fetch({ reset: true })
    @listenTo Buggy.Vent, 'remove', @leave

  addToCollection: (model) ->
    @collection.add model

  render: ->
    @$el.html @template
    @collection.forEach @renderProject, @
    @

  renderProject: (model) ->
    v = new Buggy.Views.Project({ model: model })
    @childViews.push(v)
    @$('ul').append(v.render().el)

  newProject: (e) ->
    e.preventDefault()
    Buggy.Vent.trigger 'project:new'
