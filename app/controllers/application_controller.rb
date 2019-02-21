class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :cors_set_access_control_headers

  # https://gist.github.com/jpbalarini/54a1aa22ebb261af9d8bfd9a24e811f0
  def cors_preflight_check
    if request.method == 'OPTIONS'
      cors_set_access_control_headers
      head 200, content_type: "text/html"
    end
  end

  protected

  def cors_set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token, Auth-Token, Email, X-User-Token, X-User-Email'
    response.headers['Access-Control-Max-Age'] = '1728000'
  end
end
