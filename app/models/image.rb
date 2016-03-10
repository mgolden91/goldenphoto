class Image < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  validates :title, :body, presence: true
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :comments

  def previous_image
    Image.where(["id < ?", id]).last
  end

  def next_image
    Image.where(["id > ?", id]).first
  end

  def self.search(search)
    where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
  end
end
