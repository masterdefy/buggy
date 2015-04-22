#= require_self
#= require_tree ./mixins
#= require_tree ./models
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./routers
#
I18n.defaultLocale = 'en'
I18n.locale = 'ru'

Handlebars.registerHelper 't', (msg) -> I18n.t msg

window.Buggy =
  Routers: {}
  Views: {}
  Collections: {}
  Models: {}
  Mixins: {}
  Vent: _.clone(Backbone.Events)
  initialize: (data) ->
    Buggy.currentUser = new Buggy.Models.CurrentUser(data.current_user)
    new Buggy.Routers.MainRouter()
    Backbone.history.start()

