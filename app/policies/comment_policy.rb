class CommentPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def approver?
   if @user
    @user.editor?
   end
  end
end
