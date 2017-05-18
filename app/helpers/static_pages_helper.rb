module StaticPagesHelper
  def flipcoin
    @coin = rand.round
    if @coin == 1
      @result = "heads"
    else 
      @result = "tails"
    end
  end

end
