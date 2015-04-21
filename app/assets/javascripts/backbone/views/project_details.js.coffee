class Buggy.Views.ProjectDetails extends Backbone.View

  template: HandlebarsTemplates['project_details']

  events:
    'click button.destroy': 'deleteProject'
    'click button.edit': 'editProject'

  initialize: ->
    @childViews = []
    @listenTo @model, 'sync', @renderDetails
    @model.fetch()

  editProject: -> Buggy.Vent.trigger "project:edit", @model

  deleteProject: ->
    return unless confirm("Are you sure?")
    @model.destroy
      success: -> Buggy.Vent.trigger "project:destroy"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  renderDetails: ->
     @$el.html(@template(@model.toJSON()))
     v = new Buggy.Views.Issues({ collection: @model.issues })
     @childViews.push v
     @$('#issues').html v.render().el
