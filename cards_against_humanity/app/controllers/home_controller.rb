class HomeController < ApplicationController
  def index
    @whites = WhiteCard.all
  end
end
