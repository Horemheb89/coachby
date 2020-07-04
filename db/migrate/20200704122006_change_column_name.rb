class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :sessions, :date, :start_time
  end
end
