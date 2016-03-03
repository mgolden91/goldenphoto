class Image < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates :title, :body, presence: true
  belongs_to :user

  def previous_image
    Image.where(["id < ?", id]).last
  end

  def next_image
    Image.where(["id > ?", id]).first
  end
end
