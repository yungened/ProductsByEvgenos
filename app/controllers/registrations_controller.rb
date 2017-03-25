class RegistrationsController < Devise::RegistrationsController

  def destroy
    current_user.deleted!
    redirect_to root_path, notice: 'Your account has been deleted'
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :first_name, :last_name, :country,
                                 :region, :city, :address, :phone_number,
                                 :post_code, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:email,:first_name, :last_name, :country,
                                 :region, :city, :address, :phone_number,
                                 :post_code, :password, :password_confirmation,
                                 :current_password, :avatar)
  end
end
