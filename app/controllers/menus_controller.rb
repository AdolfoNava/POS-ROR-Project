# frozen_string_literal: true

# Base Menu Navigation
class MenusController < ApplicationController
  skip_before_action(:authenticate_user!, { only: [:landing] })
  def landing
    render 'menus/landing'
  end

  def main
    @breadcrumbs = [
      { content: 'Main Menu', href: main_path }
    ]
    render 'menus/main'
  end

  def database
    @breadcrumbs = [
      { content: 'Main Menu', href: main_path },
      { content: 'Business Management', href: database_path }
    ]
    render 'menus/database'
  end
end
