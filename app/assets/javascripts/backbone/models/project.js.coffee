class Buggy.Models.Project extends Backbone.Model
  urlRoot: '/projects'

  initialize: ->
    @listenTo @, "change:issues", @convertIssues

  convertIssues: ->
    @issues = new Buggy.Collections.Issues( @get('issues') )

  validate: (attrs, options) ->
    errors = {}
    unless attrs.name
      errors.name = ["can't be blank"]
    unless attrs.description
      errors.description = ["can't be blank"]
    errors unless _.isEmpty errors

class Buggy.Collections.Projects extends Backbone.Collection
  model: Buggy.Models.Project
  url: '/projects'
