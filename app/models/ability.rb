class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all

    if user && user.role == "admin"
      can :access, :rails_admin
      can :manage, :all
    end

    if user && user.role == "user"  
      can :add_rating, Book
      can :manage, Checkout
    end

  end
end
