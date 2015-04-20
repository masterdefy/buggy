class Buggy.Views.ProjectDetails extends Backbone.View

  template: HandlebarsTemplates['project_details']

  events:
    'click button.destroy': "deleteProject"

  initialize: ->
    @listenTo @model, 'sync', @render
    @model.fetch()

  deleteProject: ->
    return unless confirm("Are you sure?")
    @model.destroy
      success: -> Buggy.Vent.trigger "project:destroy"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
