# Init all cookie values to defaults
def checkforcookie
  if cookies[:created_at].nil?
    cookies[:totalheads] = 0
    cookies[:totaltails] = 0
    cookies[:currentresult] = 0
    cookies[:consheads] = 0
    cookies[:constails] = 0
    cookies[:tailsrecord] = 0
    cookies[:headsrecord] = 0
    cookies[:previousresult] = 0
    cookies[:totalflips] = 0
    cookies[:pingpongs] = 0
    cookies[:pingpongsrecord] = 0
    cookies[:created_at] = Time.now
    @msg = "Empty cookie, starting from scratch"
  else
    @msg = "Started #{time_ago_in_words(cookies[:created_at])} ago."
  end
end

