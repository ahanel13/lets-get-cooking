# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: []

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super

  # end

  # PUT /resource
  def update
    # current_user holds the logged in user
    @user = current_user

    if user_params[:saved_recipes] != [""]
      @current_recipe = (user_params[:saved_recipes] - @user.saved_recipes) | (@user.saved_recipes - user_params[:saved_recipes])
      @current_recipe.compact!
      @current_recipe = @current_recipe.last
    elsif
      @current_recipe = @user.saved_recipes.last

    end

    puts "\n\ncurrent reicpe::#{@current_recipe}\n\n"

    # IF they've left the password field blank, 
    # AND the devise update_without_password method returns true
    # OR IF a full update of user (including password and password_confirmation) returns true
    # THEN re-sign them in to flush their session, and redirect them back to their dashboard, and send a success message.
    # ELSE re-present the edit form they were just on (there's a handy catcher
    # in the edit view script to render the form errors, you can find them on
    # @user.errors)

    if (user_params[:password].blank? && @user.update_without_password(user_params))
      redirect_to "/recipes/#{@current_recipe}" 
      
    elsif (user_params[:password].blank? && @user.update(user_param) )
      redirect_to :back
    end 
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def user_params
    params.require(:user).permit(def user_params
      accessible = [
        :first_name,
        :last_name,
        :email,
        :password,
        :password_confirmation,
        saved_recipes:[]
      ]
      params.require(:user).permit(accessible)
    end)
  end   

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   # devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])

  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
