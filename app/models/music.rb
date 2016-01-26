class Music < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :author, presence: true, length: { maximum: 30 }
  validates :url, presence: true, length: { maximum: 140 }

end