class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def publish?
    if @user
     @user.editor?
   end
  end

  def destroy?
    if @user
      @user.editor?
    end
  end

  def update?
    if @user
      @user.editor?
    end
  end

end
