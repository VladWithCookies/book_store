class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user && user.admin?
      can :access, :rails_admin
      can :manage, :all
    elsif user
      can :add_rating, Book
      can :manage, Checkout
    end

  end
end
