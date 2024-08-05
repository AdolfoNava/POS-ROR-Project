class MenusController < ApplicationController
  def landing
    render "menus/landing"
  end
  def main
    @breadcrumbs = [
      {content: "Main Menu", href: "../main"},
    ]
    render "menus/main"
  end
  def database
    @breadcrumbs = [
      {content: "Main Menu", href: "../main"},
      {content: "Business Management", href: database_path},
    ]
    render "menus/database"
  end
end
