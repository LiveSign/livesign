class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone, :street_address, :email_address, :city, :state, :name, :zip_code, :tos_acceptance
      t.timestamps
    end
  end
end
