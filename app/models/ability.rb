# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true

    if user.present?
      can :read, Post, user_id: user.id
      can :create, Post, user_id: user.id
      can :edit, Post, user_id: user.id
      
    if user.admin?
      can :manage, Post

  end
end
