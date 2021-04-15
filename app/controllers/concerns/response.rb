module Response
  def render_success(internal_code = 200, success: true, message: '', data: {})
    data = { data: data } unless data.is_a? Hash
    json_response(:ok, internal_code, success, message, data)
  end

  def render_error(internal_code = 400, message: '')
    json_response(:bad_request, internal_code, false, message)
  end

  def render_not_found_error(internal_code = 404, message: '')
    json_response(:not_found, internal_code, false, message)
  end

  def render_unprocessable_entity(internal_code = 402, message: '')
    json_response(:unprocessable_entity, internal_code, false, message)
  end

  def json_response(status, internal_code, success, message, data = {})
    json = { success: success, code: internal_code, message: message }.merge(data)
    render status: status,
           json: json.reject { |k,v| k != :success && v.blank? }
  end
end
