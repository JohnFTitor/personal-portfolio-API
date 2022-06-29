class ProjectsController < ApplicationController
  def index
    projects = Project.all.with_attached_images
    render jsonapi: projects, class: { Project: SerializableProject }
  end
end
