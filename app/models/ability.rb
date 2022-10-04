class Ability
  include CanCan::Ability

  def initialize(user)
    if user.isadmin?
      can :manage, :all

    else
      can :destroy, Post do |post|
        post.user == user
      end
      can :destroy, Comment do |comment|
        comment.user == user
      end
      can :read, Post
      can :read, Comment

    end
  end
end
