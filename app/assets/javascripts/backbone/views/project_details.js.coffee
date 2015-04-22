class Buggy.Views.ProjectDetails extends Backbone.View

  template: HandlebarsTemplates['project_details']

  events:
    'click button.destroy': 'deleteProject'
    'click button.edit': 'editProject'

  initialize: ->
    if @model.get('user_id') is Buggy.currentUser.id
      @model.set owned: true

    @childViews = []
    @listenTo @model, 'sync', @renderDetails
    @listenTo @model, 'error', @triggerAccessDenied
    @listenTo @model, 'destroy', @triggerProjectDestroy
    @model.fetch()

  triggerAccessDenied: -> Buggy.Vent.trigger 'access_denied'
  triggerProjectDestroy: -> Buggy.Vent.trigger 'project:destroy'

  editProject: -> Buggy.Vent.trigger "project:edit", @model

  deleteProject: ->
    return unless confirm("Are you sure?")
    @model.destroy { wait: true }

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  renderDetails: ->
     @$el.html(@template(@model.toJSON()))
     v = new Buggy.Views.Issues({ collection: @model.issues })
     @childViews.push v
     @$('#issues').html v.render().el

     v1 = new Buggy.Views.NewIssue({ model: new Buggy.Models.Issue({ project_id: @model.id }) })
     @childViews.push v1
     @$('#new_issue').html v1.render().el
