# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
    def not_logged_in?
    !logged_in?
  end
end
