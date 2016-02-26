class ChangeChambersInUsers < ActiveRecord::Migration
  def up
    change_column :users, :chambers, :integer
  end

  def down
    change_column :users, :chambers, :decimal
  end
end
