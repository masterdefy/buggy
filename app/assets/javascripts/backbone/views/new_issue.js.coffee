class Buggy.Views.NewIssue extends Backbone.View

  template: HandlebarsTemplates['new_issue']

  events:
    "click button": "saveIssue"

  initialize: ->
    @listenTo @model, 'error', @parseErrorResponse

  render: ->
    @$el.html @template(@model.toJSON())
    @

  saveIssue: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save()

_.extend Buggy.Views.NewIssue.prototype, Buggy.Mixins.Validatable
