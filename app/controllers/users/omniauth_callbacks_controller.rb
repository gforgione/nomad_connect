class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env['omniauth.auth'], request.env['omniauth.params'])
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        access_token = request.env['omniauth.auth']
        @user.refresh_token = access_token.credentials.refresh_token
        @user.expires_at = Time.at(access_token.credentials.expires_at)
        @user.access_token = access_token.credentials.token
        @user.save!
    
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
  end

  def facebook
    @user = User.from_omniauth_facebook(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url
    end
  end


  def github
  @user = User.from_omniauth_github(request.env["omniauth.auth"])
  if @user.persisted?
    sign_in_and_redirect @user, :event => :authentication
    set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
    else
    session["devise.github_data"] = request.env["omniauth.auth"].except(:extra)
    redirect_to new_user_registration_path
    @user
  end
end
end