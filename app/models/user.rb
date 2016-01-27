class User < ActiveRecord::Base
  has_many :musics
  has_many :votes

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end