class Buggy.Models.Project extends Backbone.Model
  url: '/projects'

class Buggy.Collections.Projects extends Backbone.Collection
  model: Buggy.Models.Project
  url: '/projects'
