# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.member?
      can %i[read create], [Category, Topic, Post]
      can %i[update destroy], [Category, Topic, Post] do |item|
        item.user == user
      end
    elsif user.novice?
      can :read, [Category, Topic, Post]
      can :create, Post
      can %i[update destroy], Post do |post|
        post.user == user
      end
    end
  end
end
