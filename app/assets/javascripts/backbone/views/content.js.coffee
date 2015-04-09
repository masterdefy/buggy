class Buggy.Views.Content extends Backbone.View

  className: "row"

  template: HandlebarsTemplates['content']

  render: ->
    @$el.html @template
    @renderEmptyView()
    @

  renderEmptyView: ->
    v = new Buggy.Views.Empty()
    @$('#main-area').html(v.render().el)

