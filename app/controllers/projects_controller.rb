class ProjectsController < ApplicationController
  skip_before_action :authorize_request, only: [:index]

  def index
    projects = Project.all.order(created_at: :desc)
    render jsonapi: projects, class: { Project: SerializableProject }
  end

  def destroy
    return render json: { error: 'No admin user. Unauthorized request' }, status: 401 unless @current_user.role === 'admin'

    begin
      project = Project.find(params[:id])
      project.destroy
      render json: { message: 'Project successfully deleted' }, status: 200
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: 404
    end
  end
end
