class MakeSignaturesReviewable < ActiveRecord::Migration
  def change
    add_column :signatures, :verified, :boolean, null: false, default: false
  end
end
