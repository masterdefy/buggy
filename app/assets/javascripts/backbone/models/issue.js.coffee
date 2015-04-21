class Buggy.Models.Issue extends Backbone.Model
  urlRoot: '/issues'

class Buggy.Collections.Issues extends Backbone.Collection
  model: Buggy.Models.Issue
  url: '/issues'
