class User < ActiveRecord::Base
  attr_accessible :nickname
  has_many :posts, dependent: :destroy
end
