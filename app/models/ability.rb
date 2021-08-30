# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user.class.name
     when "User"
      can [:read, :filter], Receipt, user: user
     when "Retailer"
    end
  end
end
