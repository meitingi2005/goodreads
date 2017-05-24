class Books < ActiveRecord::Migration[5.0]
  def change
     create_table :books do |t|
      t.string :book_title
      t.string :similar_books #array
      t.text :other_info #hash
      t.string :book_pages #array
      t.string :savedbooks #array
      t.integer :user_id
    #   t.string :user_id
  end
  end
end
