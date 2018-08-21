class HomeController < ApplicationController
  def index
    if search_params[:white]
      @whites = []
      replace = search_params[:white]
      @blacks = BlackCard.all
                         .map { |e|
                           title = e.title.gsub('*', replace)
                           title = title.gsub('?', "? #{replace}")
                           BlackCard.new(title: title)
                         }
    elsif search_params[:black]
      black = search_params[:black]

      @whites = WhiteCard.all.map { |e|
        title = black.gsub('*', e.title)
        title = title.gsub('?', "? #{e.title}")
        WhiteCard.new(title: title) 
      }
      @blacks = []
    else
      @whites = WhiteCard.all
      @blacks = BlackCard.all
    end
  end

  private

  def search_params
    params.permit(:white, :black)
  end
end
