class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, Post
    can :read, Comment

    return unless user.present?

    can :manage, Post
    can :manage, Comment

    return unless user.isadmin?

    can :manage, :all
  end
end