class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:links) do |t|
      t.integer :recipe_id
      t.integer :ingredient_id


    end

    add_index :links, :recipe_id
    add_index :links, :ingredient_id

  end
end
