class User < ActiveRecord::Base
  has_many :climbs
  
  validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: {case_sensitive: false }
  validates :username, :email, :password, presence: true

  def slug
    username.downcase.split.join("-")
  end

  def self.find_by_slug(slug)
    self.all.detect {|s| s.slug == slug}
  end
  
  has_secure_password
end