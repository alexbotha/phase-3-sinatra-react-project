class CreateRestuarants < ActiveRecord::Migration[6.1]
  def change
    create_table :restuarants do |t|
      t.string :name 
      t.string :cuisine
      t.integer :overall_rating
      t.string :website
      
      
    end
  end
end
