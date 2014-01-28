class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    @user.editor?
  end

  class Scope
  end
end
