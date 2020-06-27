class RenameCoachFromUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :coach, :is_coach
  end
end
