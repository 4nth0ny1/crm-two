class Contact < ApplicationRecord
    belongs_to :account 

    validates :name, :phone, :role, presence: true
end 
