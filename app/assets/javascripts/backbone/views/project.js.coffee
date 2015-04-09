class Buggy.Views.Project extends Backbone.View

  template: HandlebarsTemplates['project']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
