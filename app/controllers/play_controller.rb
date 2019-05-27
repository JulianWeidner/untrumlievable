class PlayController < ApplicationController
  
  
  def play
    @tweet = random_tweet
  end

  #takes users choice via hidden params via button_to
  def faker_choice
    @choice = params[:choice]
  end

  def comparison
    puts "called comparision"
    if @isFake == true && @choice == 'fake' #isFake is true because its a fake tweet
      #correct
      @outcome = true
      @tweet = random_tweet
      puts 'correct'
    elsif @isFake == false && @choice == 'real' #isFake is false because its a real tweet
      #correct 
      @outcome = true
      @tweet = random_tweet
      puts 'correct' + @isFake.to_s
    else
      @outcome = false
      @tweet = random_tweet
      puts 'false' + @isFake.to_s
    end
  end
  #returns a random real tweet using the Tweet.id.
  #because these are not really changed, I think this method will work. Only time will tell
  def random_real
    Tweet.find(Random.rand(1..Tweet.count))
  end

  #returns a random fake tweet using the random_records gem
  def random_fake
    #small_group_faketweets = Faketweet.random_records(100, strategy: 2)
    random_id = Faketweet.random_records(1)
    Faketweet.find(random_id.ids[0])
  end

  #returns a value between 0.0 - 10.0
  def random_num_spread
    num = Random.new
    num.rand(0.0..10.0)
  end

  #loads a random real or fake tweet from the DB depending on if condition num
  def random_tweet
    #faketweet = random_fake #no need to create objects unless it fits if condition
    #realtweet = random_real #no need to create objects unless it fits if condition
    rand_num = random_num_spread
    print rand_num
    if rand_num < 5.5 
      @isFake = true
      return random_fake 
    elsif rand_num > 5.5
      @isFake = false
      return random_real
    else
      return "error"
    end
  end

end
