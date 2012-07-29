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
  
  validate :name, :email_address, :street_address, :city, :state, :zipcode, :phone, :tos_acceptance, presence: true
end
