# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= ::User.new
    can :read, :all  # start by defining rules for all users, also not logged ones
    return unless user.role == 'default'
    can :manage, Post, user: user # if the user is logged in can manage it's own posts
    can :manage, Comment, user: user # logged in users can also create comments
    return unless user.role == 'admin'
    can :manage, :all # finally we give all remaining permissions only to the admins
  end
end
