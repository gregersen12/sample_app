class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }

  mount_uploader :picture, PictureUploader
  validate :picture_size

  def picture_size
  	if picture_size > 5.megabytes
  		errors.add(:picture, "Should be less than 5MB")
  	end
  end
end
