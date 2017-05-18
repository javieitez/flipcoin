module StaticPagesHelper

  # Init all cookie values to defaults
  def checkforcookie
    if cookies[:headseries].nil?
      cookies[:headseries] = 0
      cookies[:tailseries] = 0
      cookies[:lastresult] = 0
      cookies[:consmatches] = 0
      cookies[:previousresult] = 0
      @msg = "Empty cookie, setting all values to 0"
    else
      @msg = "Cookie exists"
    end
  end

  def flipcoin
    @coin = rand.round
    if @coin == 1
      cookies[:headseries] = cookies[:headseries].to_i + 1
      @result = 'heads'
    else 
      cookies[:tailseries] = cookies[:tailseries].to_i + 1
      @result = 'tails'
    end
    cookies[:lastresult] = @result
  end
  
  def consecutives
    if cookies[:lastresult] == cookies[:previousresult]
      # increase consecutive matches
      cookies[:consmatches] = cookies[:consmatches].to_i + 1 
    else
      # reset counter
      cookies[:consmatches] = 0
      cookies[:previousresult] = cookies[:lastresult]
    end
    @result = cookies[:consmatches] 
  end

end

