module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render_not_found_error(internal_code = 404, message: e.message)
    end
  end
end
