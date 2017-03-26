class RegistrationsController < Devise::RegistrationsController

  def destroy
    current_user.deleted!
    redirect_to root_path, notice: 'Your account has been deleted'
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :first_name, :last_name,
                                  :city, :address, :phone_number,
                                  :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email,:first_name, :last_name,
                                 :city, :address, :phone_number,
                                 :password, :password_confirmation,
                                 :current_password)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    request.referrer
  end
end
