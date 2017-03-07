class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      user = User.new
    end
    if user.has_role? :admin
      can :manage, :all
    end
  end
end
