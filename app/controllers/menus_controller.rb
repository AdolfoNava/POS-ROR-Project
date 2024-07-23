class MenusController < ApplicationController
  def main
    render "menus/main"
  end
  def database
    render "menus/database"
  end
end
