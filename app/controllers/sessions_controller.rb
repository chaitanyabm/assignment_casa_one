class SessionsController < Devise::SessionsController

  
  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))

  end

  # POST /resource/sign_in


  def devise_methods
    set_flash_message!(:notice, :signed_in)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end
  
  
  ## This method intercepts SessionsController#destroy action
  ## If a signed in user tries to sign out, it allows the user to sign out
  ## If a signed out user tries to sign out again, it redirects them to sign in page
  
end