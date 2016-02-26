class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :client_number
      t.string :name
      t.string :street
      t.integer :number
      t.string :zipcode
      t.string :city
      t.string :url
      t.string :email
      t.string :company_name
      t.string :phone

      t.timestamps null: false
    end
  end
end
