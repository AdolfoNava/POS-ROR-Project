# frozen_string_literal: true

class ApplicationController < ActionController::Base # rubocop:disable Style/Documentation
  skip_forgery_protection
  before_action :authenticate_user!
end
