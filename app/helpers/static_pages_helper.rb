module StaticPagesHelper

  # Init all cookie values to defaults
  def checkforcookie
    if cookies[:headseries].nil?
      cookies[:headseries] = 0
      cookies[:tailseries] = 0
      cookies[:lastresult] = 0
      cookies[:consheads] = 0
      cookies[:constails] = 0
      cookies[:tailsrecord] = 0
      cookies[:headsrecord] = 0
      cookies[:consmatches] = 0
      cookies[:previousresult] = 0
      cookies[:mostconsmatches] = 0
      cookies[:totalflips] = 0
      cookies[:pingpongs] = 0
      cookies[:pingpongsrecord] = 0
      cookies[:created_at] = Time.now
      @msg = "Empty cookie, setting all values to 0"
    else
      @msg = "Started #{time_ago_in_words(cookies[:created_at])} ago."
    end
  end

  def flipcoin
    @coin = rand.round
    cookies[:totalflips] = cookies[:totalflips].to_i + 1
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
    if cookies[:lastresult] == cookies[:previousresult] and cookies[:lastresult] == 'heads'
      compareheads
      increase_counter
      compare_matches
    elsif cookies[:lastresult] == cookies[:previousresult] and cookies[:lastresult] == 'tails'
      comparetails
      increase_counter
      compare_matches
    else
      reset_counter
      compare_pingpongs
    end
    @result = cookies[:consmatches] 
  end

def increase_counter
  # reset the pingpongs counter
    cookies[:pingpongs] = 0
  # increase the matches counter, first series go from 0 to 2
  if cookies[:consmatches].to_i == 0
    cookies[:consmatches] = 2
  else
    cookies[:consmatches] = cookies[:consmatches].to_i + 1
  end
end

def compare_matches
  # compare to the biggest recorded match, store if bigger
  if cookies[:consmatches].to_i > cookies[:mostconsmatches].to_i
    flash[:notice] = "New Record on on consecutive flips"
    cookies[:mostconsmatches] = cookies[:consmatches]
  end
end

def comparetails
  if cookies[:constails].to_i > cookies[:tailsrecord].to_i
    cookies[:tailsrecord] = cookies[:constails] 
  end
  cookies[:constails] = cookies[:constails].to_i + 1  
  cookies[:consheads] = 0
end

def compareheads
  if cookies[:consheads].to_i > cookies[:headsrecord].to_i
    cookies[:headsrecord] = cookies[:consheads] 
  end
  cookies[:consheads] = cookies[:consheads].to_i + 1  
  cookies[:constails] = 0
end

def compare_pingpongs
  if cookies[:pingpongs].to_i > cookies[:pingpongsrecord].to_i
    flash[:notice] = "New Record on alternate flips"
    cookies[:pingpongsrecord] = cookies[:pingpongs]
  end
end

def reset_counter
    cookies[:consmatches] = 0
    cookies[:previousresult] = cookies[:lastresult]
    cookies[:pingpongs] = cookies[:pingpongs].to_i + 1
end

def pingpongscounter
  cookies[:pingpongs] = cookies[:pingpongs].to_i + 1
end

end

