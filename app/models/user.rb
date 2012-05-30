class User < ActiveRecord::Base
  attr_accessible :nickname
  has_many :posts, dependent: :destroy
  validates :nickname, presence: true, length: { maximum: 50 }
end
