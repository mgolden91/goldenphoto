class User < ActiveRecord::Base
  has_many :images
  has_many :comments
  before_save { self.role ||= :friend }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }, presence: true
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:admin, :member, :friend]
end
