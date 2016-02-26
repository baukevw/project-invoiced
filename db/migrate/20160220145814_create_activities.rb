class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :invoice_id
      t.text :description
      t.integer :amount
      t.integer :price_ex_fat

      t.timestamps null: false
    end
  end
end
