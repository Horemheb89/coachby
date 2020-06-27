class RemoveUserAndAddCoachAndAthleteToContracts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :contracts, :user
    add_column :contracts, :coach_id, :bigint
    add_index :contracts, :coach_id

    add_column :contracts, :athlete_id, :bigint
    add_index :contracts, :athlete_id
  end
end
