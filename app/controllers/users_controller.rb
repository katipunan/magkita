# frozen_string_literal: true

class UsersController < Clearance::UsersController
  layout 'simple_form'

  private

  def user_from_params
    name = user_params.delete(:name)
    email = user_params.delete(:email)
    password = user_params.delete(:password)
    password_confirmation = user_params.delete(:password_confirmation)

    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.name = name
      user.email = email
      user.password = password
      user.password_confirmation = password_confirmation
    end
  end
end
