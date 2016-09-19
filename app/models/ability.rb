class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Book

    if user && user.admin?
      can :read, :all
      can :access, :rails_admin
      can :manage, :all
    elsif user
      can :read, Order, user_id: user.id
      can :add_rating, Book
      can :manage, Checkout
    end

  end
end
