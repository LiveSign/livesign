class Signature < ActiveRecord::Base
  belongs_to :user
  belongs_to :proposition

  validates_uniqueness_of :user_id, :scope => [:proposition_id]
  validates_presence_of :user_id, :proposition_id

  attr_accessible :user, :proposition, :data, :opentok_archive_id, :verified
end
