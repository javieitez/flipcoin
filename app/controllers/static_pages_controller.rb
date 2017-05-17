class StaticPagesController < ApplicationController
  def home

  end

  def help
  end

  def flipcoin
    @coin = rand.round
    if @coin == 1
      result = "heads"
    else 
      result = "tails"
    end
  end

end
