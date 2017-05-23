module StaticPagesHelper

require 'initcookies'

def flipcoin
  @coin = rand.round
  cookies[:totalflips] = cookies[:totalflips].to_i + 1
  if @coin == 1
    cookies[:totalheads] = cookies[:totalheads].to_i + 1
    @result = 'heads'
  else
    cookies[:totaltails] = cookies[:totaltails].to_i + 1
    @result = 'tails'
  end
  cookies[:currentresult] = @result
end

def consecutives # keep track of consecutive matches
  @current = cookies[:currentresult]
  @prev = cookies[:previousresult]
  if @current ==  @prev and @current == 'heads'
    compareheads
    cookies[:consheads] = cookies[:consheads].to_i + 1
    check_new_high
    cookies[:pingpongs] = 0
  elsif @current == @prev and @current == 'tails'
    comparetails
    cookies[:constails] = cookies[:constails].to_i + 1
    check_new_high
    cookies[:pingpongs] = 0
  else
    compare_pingpongsrecord
    cookies[:previousresult] = cookies[:currentresult]
    cookies[:pingpongs] = cookies[:pingpongs].to_i + 1
    cookies[:consheads] = 0
    cookies[:constails] = 0
  end
end

def check_new_high
  if newrecord?
    flash[:notice] = "New Record on on consecutive flips"
  end
end

def newpingpongrecord?
  @amount = cookies[:pingpongs].to_i
  @record = cookies[:pingpongsrecord].to_i
  if @amount  > @record and @amount > 1
    true
  else
    false
  end
end


def newrecord?
  @cons = [cookies[:constails].to_i, cookies[:consheads].to_i].max
  @rec = [cookies[:tailsrecord].to_i, cookies[:headsrecord].to_i].max
  if @cons > @rec
    true
  else
    false
  end
end

def compareheads
  if cookies[:consheads].to_i > cookies[:headsrecord].to_i #new record?
    cookies[:headsrecord] = cookies[:consheads]
  end
  cookies[:constails] = 0 # reset tails series
end

def comparetails
  if cookies[:constails].to_i > cookies[:tailsrecord].to_i #new record?
    cookies[:tailsrecord] = cookies[:constails]
  end
  cookies[:consheads] = 0 # reset heads series
end

def compare_pingpongsrecord
  if newpingpongrecord?
    flash[:notice] = "New Record on alternate flips"
    cookies[:pingpongsrecord] = cookies[:pingpongs]
  end
end

end
