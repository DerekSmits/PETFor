# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new
    can :read, Post, public: true

    if user.has_role? :user
      can :read, Post, user_id: user.id
      can :create, Post, user_id: user.id
      can :edit, Post, user_id: user.id
      can :read, Comment
      can :create, Comment, user_id: user.id
    end
    if user.has_role? :admin
      can :manage, :all
    end
    if user.has_role? :moderator
      can :read, Post
      can :edit, Post
      can :read, Comment
      can :edit, Comment
    end
  end
end
