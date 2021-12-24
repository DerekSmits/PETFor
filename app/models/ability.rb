# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||=User.new
    can :read, Post

    if user.has_role? :user
      can :read, Post, author_id: user.id
      can :create, Post, author_id: user.id
      can :edit, Post, author_id: user.id
      can :read, Comment
      can :create, Comment, author_id: user.id
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
