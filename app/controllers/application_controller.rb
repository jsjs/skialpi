class ApplicationController < ActionController::Base

  protect_from_forgery
  include SessionsHelper
  include UsersHelper
  include TracksHelper
  include StatsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

end
