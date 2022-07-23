class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.string :name, presence: true
      t.string :phone, presence: true
      t.string :role, presence: true
      t.string :email
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
