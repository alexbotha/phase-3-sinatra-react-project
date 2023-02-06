class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :review 
      t.integer :rating
      t.string :company_name
      t.timestamp :created_at
      t.integer :user_id 
      t.integer :restuarant_id
    end
  end
end
