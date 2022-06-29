class ProjectsController < ApplicationController
  skip_before_action :authorize_request, only: [:index]

  def index
    projects = Project.all.order(created_at: :desc)
    render jsonapi: projects, class: { Project: SerializableProject }
  end

  def create
    unless @current_user.role == 'admin'
      return render json: { error: 'No admin user. Unauthorized request' },
                    status: 401
    end

    ctx = Projects::Create.call({project_params: })

    return render json: ctx[:errors], status: ctx[:status] if ctx.failure?

    render jsonapi: ctx[:message], status: ctx[:status], class: { Project: SerializableProject }
  end

  def destroy
    unless @current_user.role == 'admin'
      return render json: { error: 'No admin user. Unauthorized request' },
                    status: 401
    end

    begin
      project = Project.find(params[:id])
      project.destroy
      render json: { message: 'Project successfully deleted' }, status: 200
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: 404
    end
  end

  private

  def project_params
    params.permit(:title, :desktop_image, :mobile_image, :tags, :description, :live, :source, :demo)
  end
end
