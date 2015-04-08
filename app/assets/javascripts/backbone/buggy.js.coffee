#= require_self
#= require_tree ./routers

window.Buggy =
  Routers: {}
  initialize: ->
    new Buggy.Routers.MainRouter()
    Backbone.history.start()

