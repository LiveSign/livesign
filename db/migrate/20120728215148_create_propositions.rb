class CreatePropositions < ActiveRecord::Migration
  def change
    create_table :propositions do |t|
      t.text :title, :overview, :full, :slug, :state
      t.integer :user_id
      t.timestamps
    end
  end
end
