# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  
  # callback for facebook
  # def facebook
  #   # callback_for(:facebook)は今回いらない
  #   # ユーザ登録まで自動的に実施せず、ユーザ検索のみ実施するように変更
  #   @user = User.find_omniauth(request.env["omniauth.auth"])

  #   if @user
  #     sign_in_and_redirect @user #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
  #   else
  #     # Facebookから取得した情報をsessionに格納
  #     session["devise.facebook_data"] = request.env["omniauth.auth"]
  #     #redirect_to new_user_registration_url

  #     # 新規ユーザの場合、`ユーザ名`登録用のテンプレートをrender
  #     @user = User.new()
  #     render 'devise/registrations/new'
  #   end
  # end

  def facebook
    callback_from(:facebook)
  end

  def twitter
    callback_from(:twitter)
  end

  def google_oauth2
    callback_from(:google)
  end

  #以下公式のやつ。今回使わない。
  # def callback_for(provider)
  #   @user = User.from_omniauth(request.env["omniauth.auth"])
  #   if @user.persisted?
  #     sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
  #     set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
  #   else
  #     session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
  #     redirect_to new_user_registration_url
  #   end
  # end

  private
  
  def callback_from(provider)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    
    if @user
      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
    else
      session["devise.omniauth_data"] = request.env["omniauth.auth"].except("extra")
      @user = User.new()
      redirect_to new_user_registration_path
    end
  end

  def failure
    redirect_to root_path
  end

end
