class ProjectsController < ApplicationController
  skip_before_action :authorize_request, only: [:index]

  def index
    projects = Project.all
    render jsonapi: projects, class: { Project: SerializableProject }
  end
end
