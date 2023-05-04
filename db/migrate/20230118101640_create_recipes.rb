class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name # ok
      
      t.string :difficulty # ok
      t.string :price_level # ok 
      
      t.text :ingredients # ok
      t.text :ustensils # ok
      t.text :instructions # ok

      t.string :prep_time # ok
      t.string :reste_time # ok
      t.string :cook_time # ok
      t.string :total_time # ok
      
      t.timestamps
    end
  end
end
