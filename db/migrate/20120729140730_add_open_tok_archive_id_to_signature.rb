class AddOpenTokArchiveIdToSignature < ActiveRecord::Migration
  def change
    add_column :signatures, :opentok_archive_id, :string
  end
end
