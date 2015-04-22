class Buggy.Models.CurrentUser extends Backbone.Model

  initialize: ->
    @listenTo Buggy.Vent, 'user:logged_in', @login
    @listenTo Buggy.Vent, 'user:logged_out', @logout

  login: (id, email) ->
    @set id: id, email: email, loggedIn: true

  logout: ->
    m = new Buggy.Models.Login({ id: @id })
    m.destroy
      success: (model, data) =>
        @set loggedIn: false
        delete @id
        delete @attributes.email
        delete @attributes.id
        window.csrf(data.csrf)
