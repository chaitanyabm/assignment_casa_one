class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }
  
  def after_sign_in_path_for(resource)
    if resource 
 		posts_path
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end
end
