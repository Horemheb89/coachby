class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.integer :rounds
      t.integer :reps
      t.references :session, null: false, foreign_key: true
      t.integer :weight
      t.integer :rest_time
      t.text :name

      t.timestamps
    end
  end
end
