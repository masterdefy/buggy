#= require_self
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./routers

window.Buggy =
  Routers: {}
  Views: {}
  Collections: {}
  Models: {}

  initialize: ->
    new Buggy.Routers.MainRouter()
    Backbone.history.start()

