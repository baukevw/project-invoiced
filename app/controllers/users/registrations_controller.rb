class Users::RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:company_name, :name, :street, :number,
                                 :zipcode, :city, :url, :phone, :bank_number,
                                 :bank_name, :fat_code, :chambers,
                                 :company_logo, :payment_instructions, :email,
                                 :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:company_name, :name, :street, :number,
                                 :zipcode, :city, :url, :phone, :bank_number,
                                 :bank_name, :fat_code, :chambers,
                                 :company_logo, :payment_instructions, :email,
                                 :password, :password_confirmation,
                                 :current_password)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
