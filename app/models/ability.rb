class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= ::User.new
    can :read, :all # start by defining rules for all users, also not logged ones
    return unless user.present?

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    return unless user.role == 'admin'

    can :manage, :all # finally we give all remaining permissions only to the admins
  end
end
