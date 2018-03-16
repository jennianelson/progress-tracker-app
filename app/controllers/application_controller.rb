class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery 
    #took out with: :exception
  before_action :authenticate_user!
  helper_method :parse_api
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def parse_api(resource, set_id)
    standard_set = HTTParty.get("http://api.commonstandardsproject.com/api/v1/#{resource}/#{set_id}",
    :headers => {'Content-Type' => 'application/json', 'Api-key' => 'KeVHcV7nEnj4PGEGaSdovabT'} )
    JSON.parse(standard_set.to_s)
  end

  def get_standards_array(parsed_api)
    standards = parsed_api["data"]["standards"].sort_by { |s| s[1]["asnIdentifier"]}
     @standards_array = standards.map do |standard|
        a = standard[1]
          if a["depth"] > 0
              if a["comments"]
                { description: "#{a["description"]}--" + " #{a["comments"][0]}", asn_id: a["asnIdentifier"], dot_notation: a["statementNotation"] }
              else
                { description: a["description"], asn_id: a["asnIdentifier"], dot_notation: a["statementNotation"] }
              end
          end
      end.compact
    end
 
  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
