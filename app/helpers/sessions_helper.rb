module SessionsHelper

  def get_session_id
    return request.session_options[:id]
  end
end
