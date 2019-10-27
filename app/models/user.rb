class User < ApplicationRecord
  include Clearance::User

  validates :password,
    confirmation: {
      if: :require_password?
    },
    length: {
      minimum: 8,
      if: :require_password?
    }
  validates :password_confirmation,
    presence: {
      if: :require_password?
    }

  def require_password?
    new_record?
  end
end
