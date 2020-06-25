class RemoveProgramIdFromContracts < ActiveRecord::Migration[6.0]
  def change
    remove_column :contracts, :program_id
    add_reference :programs, :contract
  end
end
