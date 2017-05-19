module StaticPagesHelper

  # Init all cookie values to defaults
  def checkforcookie
    if cookies[:headseries].nil?
      cookies[:headseries] = 0
      cookies[:tailseries] = 0
      cookies[:lastresult] = 0
      cookies[:consmatches] = 0
      cookies[:previousresult] = 0
      cookies[:mostconsmatches] = 0
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
  
  def consecutives # keep track of consecutive matches
    if cookies[:lastresult] == cookies[:previousresult]
      # increase the cookie-based counter, first series go from 0 to 2
      if cookies[:consmatches].to_i == 0
        cookies[:consmatches] = 2
      else
        cookies[:consmatches] = cookies[:consmatches].to_i + 1
      end
      # compare to the biggest recorded match, store if bigger
      if cookies[:consmatches].to_i > cookies[:mostconsmatches].to_i
        cookies[:mostconsmatches] = cookies[:consmatches]
      end
    else
      # reset counter
      cookies[:consmatches] = 0
      cookies[:previousresult] = cookies[:lastresult]
    end
    @result = cookies[:consmatches] 
  end

end

