class Signature < ActiveRecord::Base
  attr_accessible :user, :proposition, :data
  belongs_to :user
  belongs_to :proposition
  validates_uniqueness_of :user_id, :scope => [:proposition_id]
  validates :user_id, :proposition_id, :data, presence: true

  validate :equal_user_and_proposition_state

  def equal_user_and_proposition_state
    if self.user.state != self.proposition.state
      self.errors.add(:base, "You live in a different state and cannot sign this proposition.")
    end
  end

end
