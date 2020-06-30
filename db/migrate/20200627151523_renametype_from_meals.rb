class RenametypeFromMeals < ActiveRecord::Migration[6.0]
  def change
        rename_column :meals, :type, :name
  end
end
