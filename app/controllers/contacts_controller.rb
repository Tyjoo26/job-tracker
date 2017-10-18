class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.create(contact_params)
    
    if @contact.save
      flash[:success] = "You've successfully saved a contact"
      redirect_to company_path(@company)
    else
      flash[:success] = "Please fill out all the form fields"
      redirect_to company_path(@company)
    end
  end



  private

  def contact_params
    params.require(:contact).permit(:full_name, :position, :email, :company_id)
  end

end
