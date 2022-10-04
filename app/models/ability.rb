class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, Post
    can :read, Comment

    return unless user.present?

    can :manage, Post, user_id: user.id
    can :manage, Comment, user_id: user.id

    return unless user.isadmin?

    can :manage, :all
  end
end
