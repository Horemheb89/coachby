class DeleteForeignKeyAndAddNew < ActiveRecord::Migration[6.0]
  def change
    #remove_reference :exercises, :session, index: true, foreign_key: true
    add_reference :exercises, :training, index: true, foreign_key: true
  end
end
