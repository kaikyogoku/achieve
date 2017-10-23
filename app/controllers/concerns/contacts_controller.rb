class ContactsController < ApplicationController
  def index
        @contacts = Contact.all
  end

  def new
   @contact = Contact.new
  end

  def create
    Contact.create(contacts_params)
        redirect_to contacts_path
  end

  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
