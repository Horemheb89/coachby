class DeleteForeignKeyAndAddNew < ActiveRecord::Migration[6.0]
  def change
    add_reference :exercises, :training, index: true, foreign_key: true
  end
end
