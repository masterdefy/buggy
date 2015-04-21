class Buggy.Views.Issues extends Backbone.View

  template: HandlebarsTemplates['issues']

  initialize: ->
    @childViews = []
    @listenTo Buggy.Vent, 'issue:create', @addToCollection
    @listenTo @collection, 'add', @renderIssue
    @listenTo @collection, 'add', @updateCounter

  updateCounter: ->
    @$('span').text @collection.length

  addToCollection: (model) ->
    @collection.add model

  render: ->
    @$el.html(@template({ count: @collection.length }))
    @collection.forEach @renderIssue, @
    @

  renderIssue: (model) ->
    v = new Buggy.Views.Issue({ model: model })
    @childViews.push v
    @$('#issues_list').append(v.render().el )
