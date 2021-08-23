# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user.class.name
     when "User"
      can [:read], Receipt, user: user
     when "Retailer"
    end
  end
end
