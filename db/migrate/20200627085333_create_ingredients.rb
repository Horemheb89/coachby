class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.integer :proteins
      t.integer :fats
      t.integer :carbs
      t.string :category
      t.string :name

      t.timestamps
    end
  end
end
