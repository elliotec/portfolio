class CommentPolicy < ApplicationPolicy
  attr_accessor :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def approver?
    if @user.nil? || @user.twitterman?
      false
    else
    @user.editor? || @user.author?
    end
  end

  def destroy?
    approver?
  end

  def create?
    if @user.nil? || @user.twitterman?
      false
    else
    @user.author? || @user.editor?
    end
  end
end
