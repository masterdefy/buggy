class Buggy.Views.NewProject extends Backbone.View

  template: HandlebarsTemplates['new_project']

  events:
    "click button": "saveProject"

  initialize: ->
    @listenTo @model, 'sync', @checkForOwnership
    @listenTo @model, 'invalid', @renderErrors
    @listenTo @model, 'error', @parseErrorResponse

    @model.fetch() unless @model.isNew()

  checkForOwnership: ->
    if @model.get('user_id') is Buggy.currentUser.id
      @render()
    else
      Buggy.Vent.trigger 'access_denied'

  render: ->
    @$el.html @template(@model.toJSON())
    @

  saveProject: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save {},
      success: (model) -> Buggy.Vent.trigger 'project:create', model

_.extend Buggy.Views.NewProject.prototype, Buggy.Mixins.Validatable
