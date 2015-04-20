class Buggy.Models.Project extends Backbone.Model
  urlRoot: '/projects'

class Buggy.Collections.Projects extends Backbone.Collection
  model: Buggy.Models.Project
  url: '/projects'
