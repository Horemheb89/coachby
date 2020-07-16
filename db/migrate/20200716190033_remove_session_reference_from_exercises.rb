class RemoveSessionReferenceFromExercises < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercises, :session_id
  end
end
