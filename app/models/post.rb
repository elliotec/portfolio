class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy

  def publish!
    published = true
    save!
  end
end
