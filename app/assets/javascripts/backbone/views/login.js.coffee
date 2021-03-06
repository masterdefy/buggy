class Buggy.Views.Login extends Backbone.View

  template: HandlebarsTemplates['login']

  events:
    'click button': 'login'

  initialize: ->
    @listenTo @model, 'error', @renderError
    @listenTo @model, 'sync', @triggerLoggedIn

  triggerLoggedIn: ->
    Buggy.Vent.trigger 'user:logged_in', @model.get('id'), @model.get('email')

  renderError: ->
    @$('.alert').html('Credentials are not valid').show()

  login: (e) ->
    e.preventDefault()
    @model.set email: @$('#email').val()
    @model.set password: @$('#password').val()
    @model.save()

  render: ->
    @$el.html @template()
    @
