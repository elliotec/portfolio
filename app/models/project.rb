class Project < ActiveRecord::Base
  validates :technologies_used, presence: true
  validates :name, length: { minimum: 2}
  has_many :comments, as: :commentable
  has_attached_file :image
end
