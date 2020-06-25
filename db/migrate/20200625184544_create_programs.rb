class CreatePrograms < ActiveRecord::Migration[6.0]
  def change
    create_table :programs do |t|
      t.integer :proteins_target
      t.integer :fats_target
      t.integer :carbs_target

      t.timestamps
    end
  end
end
