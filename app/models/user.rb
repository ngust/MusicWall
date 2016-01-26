class User < ActiveRecord::Base
  has_many :musics

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end