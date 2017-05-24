class ModifyUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :savedbooks, :string
  end
  
  def down
    remove_column :users, :savedbooks
  end
end
