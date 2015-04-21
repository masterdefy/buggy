class Buggy.Views.Issue extends Backbone.View

  template: HandlebarsTemplates['issue']

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

