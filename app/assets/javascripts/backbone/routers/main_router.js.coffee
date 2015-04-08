class Buggy.Routers.MainRouter extends Backbone.Router

  routes:
    '': 'index'

  index: ->
    console.log 'hello from router'
