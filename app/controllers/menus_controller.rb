class MenusController < ApplicationController
  def landing
    render "menus/landing"
  end
  def main
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
    ]
    render "menus/main"
  end
  def database
    @breadcrumbs = [
      {content: "Main Menu", href: main_path},
      {content: "Business Management", href: database_path},
    ]
    render "menus/database"
  end
end
