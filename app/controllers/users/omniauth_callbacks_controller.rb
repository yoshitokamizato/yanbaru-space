class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # callback for google
  def google_oauth2
    callback_for(:google)
  end

  # common callback method
  def callback_for(provider)
    auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth)
    session[:google_image] = auth.info.image

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_user_registration_url
    end
  rescue ActiveRecord::RecordInvalid => e
    redirect_to new_user_registration_url, flash: { errors: e.record.errors.full_messages }
  end
end