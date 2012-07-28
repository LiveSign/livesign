class Proposition < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  has_many :signatures

  before_save :title_to_slug

  def title_to_slug
    self.slug = self.title.transliterate.downcase.gsub(/[^a-z0-9 ]/, ' ').strip.gsub(/[ ]+/, '-')
  end

end
