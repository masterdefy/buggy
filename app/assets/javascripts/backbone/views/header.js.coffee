class Buggy.Views.Header extends Backbone.View

  className: "navbar"

  template: HandlebarsTemplates['header']

  initialize: ->
    @listenTo Buggy.currentUser, 'change:loggedIn', @render

  render: ->
    @$el.html @template({ current_user: Buggy.currentUser.get('loggedIn') })
    @
