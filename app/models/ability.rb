# app/models/ability.rb

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    # Define your authorization rules here
    can :read, Group
  end
end
