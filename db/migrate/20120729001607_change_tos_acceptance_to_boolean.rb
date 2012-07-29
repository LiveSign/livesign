class ChangeTosAcceptanceToBoolean < ActiveRecord::Migration
  def up
    remove_column(:users, :tos_acceptance)
    add_column(:users, :tos_acceptance, :boolean)
  end

  def down
    remove_column(:users, :tos_acceptance)
    add_column(:users, :tos_acceptance, :string)
  end
end
