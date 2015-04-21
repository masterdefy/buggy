class Buggy.Models.CurrentUser extends Backbone.Model

  initialize: ->
    @listenTo Buggy.Vent, 'user:logged_in', @login

  login: (id, email) ->
    @set id: id, email: email, loggedIn: true
