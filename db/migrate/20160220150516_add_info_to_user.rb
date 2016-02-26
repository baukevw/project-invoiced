class AddInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :company_name, :string
    add_column :users, :name, :string
    add_column :users, :street, :string
    add_column :users, :number, :integer
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :url, :string
    add_column :users, :phone, :string
    add_column :users, :bank_number, :string
    add_column :users, :bank_name, :string
    add_column :users, :fat_code, :string
    add_column :users, :chambers, :number
    add_column :users, :company_logo, :string
    add_column :users, :payment_instructions, :text
  end
end
