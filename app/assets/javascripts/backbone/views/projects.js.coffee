class Buggy.Views.Projects extends Backbone.View

  template: HandlebarsTemplates['projects']

  initialize: ->
    @listenTo @collection, "reset", @render
    @collection.fetch({ reset: true })

  render: ->
    @$el.html @template
    @collection.forEach @renderProject, @
    @

  renderProject: (model) ->
    v = new Buggy.Views.Project({ model: model })
    @$('ul').append(v.render().el)
