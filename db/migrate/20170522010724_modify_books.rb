class ModifyBooks < ActiveRecord::Migration[5.0]
  def up
    remove_column :books, :savedbooks
  end
  
  def down
    add_column :books, :savedbooks, :string
  end
end
