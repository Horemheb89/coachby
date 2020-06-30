class ChangedateNameinMealTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :meals, :date, :start_time
  end
end
