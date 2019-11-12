# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Clearance::Controller
  alias clearance_authorize authorize
  include Pundit
end
