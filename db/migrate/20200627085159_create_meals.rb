class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :type
      t.datetime :date
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
