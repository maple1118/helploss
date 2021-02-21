class Customer::ContactsController < ApplicationController

  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to customer_contacts_thanks_path
    else
      redirect_to root_path
    end
  end

  def thanks
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:contact)
  end
end
