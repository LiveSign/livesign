class Proposition < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :signatures
end
