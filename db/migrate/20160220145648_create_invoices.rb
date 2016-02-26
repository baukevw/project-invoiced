class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number
      t.date :date
      t.integer :client_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
