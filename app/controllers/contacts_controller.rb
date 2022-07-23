class ContactsController < ApplicationController
    before_action :set_contact, only: %i[ show edit update destroy ]

    def index
        if params[:account_id]
            account = Account.find(params[:account_id])
            @contacts = account.contacts.where(account: account)
        else 
            @contacts = account.contacts
        end 
    end 

    def show 
        
    end 

    def new 
        @contact = Contact.new(account_id: params[:account_id]) 
    end 

    def create 
        @contact = Contact.new(contact_params)
        if @contact.save 
            redirect_to @contact, notice: "Contact was successfully createdd!"
        else 
            render :new
        end 
    end 

    def destroy 
        @contact.destroy 
        redirect_to @contacts_url, notice: "Contact was successfully destroyed!"
    end 

    private 

    def set_contact
        @contact = Contact.find(params[:id])
    end 

    def contact_params 
        params.require(:contact).permit(:name, :role, :phone, :email, :account_id)
    end 

end 
