class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.integer :user_id, :proposition_id
      t.text :data
      t.timestamps
    end
  end
end
