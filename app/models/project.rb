class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  has_many :comments, as: :commentable
  has_attached_file :image
end
