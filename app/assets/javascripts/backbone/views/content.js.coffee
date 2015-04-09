class Buggy.Views.Content extends Backbone.View

  className: "row"

  template: HandlebarsTemplates['content']

  render: ->
    @$el.html @template
    @renderEmptyView()
    @renderProjectsView()
    @

  renderEmptyView: ->
    v = new Buggy.Views.Empty()
    @$('#main-area').html(v.render().el)

  renderProjectsView: ->
    v = new Buggy.Views.Projects({ collection: new Buggy.Collections.Projects })
    @$('#sidebar-area').html(v.render().el)

