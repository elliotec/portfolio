class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  def approve!
    approved = true
    save!
  end
end
