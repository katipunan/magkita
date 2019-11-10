# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  enum role: [:member, :organizer, :admin]

  validates :name, presence: true
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
