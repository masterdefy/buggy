class Buggy.Views.ProjectDetails extends Backbone.View

  template: HandlebarsTemplates['project_details']

  events:
    'click button.destroy': 'deleteProject'
    'click button.edit': 'editProject'

  initialize: ->
    @listenTo @model, 'sync', @render
    @model.fetch()

  editProject: -> Buggy.Vent.trigger "project:edit", @model

  deleteProject: ->
    return unless confirm("Are you sure?")
    @model.destroy
      success: -> Buggy.Vent.trigger "project:destroy"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
