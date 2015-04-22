class Buggy.Views.Header extends Backbone.View

  className: "navbar"

  template: HandlebarsTemplates['header']

  initialize: ->
    @listenTo Buggy.currentUser, 'change:loggedIn', @render
    @listenTo Buggy.Vent, 'language:change', @render

  render: ->
    @$el.html @template({ current_user: Buggy.currentUser.get('loggedIn') })
    @
