# t.string   "phone"
# t.string   "street_address"
# t.string   "email_address"
# t.string   "city"
# t.string   "state"
# t.string   "name"
# t.string   "zip_code"
# t.string   "tos_acceptance"
class User < ActiveRecord::Base

  has_many :signatures

  validates :name, :email_address, :street_address, :city, :state, :zip_code, :phone, :tos_acceptance, presence: true

  validates_uniqueness_of :email_address

  attr_accessible :name, :email_address, :street_address, :city, :state, :zip_code, :phone, :tos_acceptance

end
