class ContactsController < ApplicationController
skip_before_action :authenticate_user!
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = 'Contact was successfully registered.'
      redirect_to root_path
    else
      flash[:notice] = 'Your profile has not been created, please update your profile later.'
      redirect_to root_path
    end
  end

  def contact_params
  params.require(:contact).permit(:email)
  end

end
