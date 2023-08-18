class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    can :read, Group, user_id: user.id
    can :read, Deal, author_id: user.id
  end
end
