class Vote < ActiveRecord::Base
  belongs_to :music
  belongs_to :user

  validates :user_id, uniqueness: { scope: :music_id, message: "You can't upvote twice"} ### This checks if user_id and music_id pair unique

  #validates :username, presence: true
  # validates :email, presence: true
  # validates :password, presence: true
end