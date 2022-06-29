class Projects::Create
  include Interactor

  before do
    context.project_params ||= context.params
  end

  def call
    sanitize_params
    create_project!
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    handle_errors('There was an error with the image you try to upload')
  rescue StandardError => e
    handle_errors(e.message)
  end

  private

  def sanitize_params
    context.project_params.tap do |hash|
      hash[:images] = []
      hash[:images].push(hash[:desktop_image])
      hash[:images].push(hash[:mobile_image])
      hash.delete(:desktop_image)
      hash.delete(:mobile_image)
    end
  end

  def create_project!
    context.message = Project.create!(context.project_params) if context.project_params

    context.status = 201
  end

  def handle_errors(message, status = 422)
    context.fail!(errors: { error: message }, status:)
  end
end
