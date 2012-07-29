class Proposition < ActiveRecord::Base
  #attr_accessible :title, :body
  belongs_to :user
  has_many :signatures

  before_save :title_to_slug

  def title_to_slug
    self.slug = ActiveSupport::Inflector.transliterate(self.title).downcase.gsub(/[^a-z0-9 ]/, ' ').strip.gsub(/[ ]+/, '-')
  end

end
