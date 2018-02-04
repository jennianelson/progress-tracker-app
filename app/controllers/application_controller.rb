class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def parse_api(set_id)
    standard_set = HTTParty.get("http://api.commonstandardsproject.com/api/v1/#{set_id}",
    :headers => {'Content-Type' => 'application/json', 'Api-key' => 'KeVHcV7nEnj4PGEGaSdovabT'} )
    JSON.parse standard_set.to_s
  end

end
