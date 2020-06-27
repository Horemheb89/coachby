class AddWeightToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :weight, :float
  end
end
