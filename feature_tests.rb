require './lib/oystercard.rb'

card = OysterCard.new
p card.balance            #should equal 0
card.top_up(20)
p card.balance
card.top_up(100)
p card.balance
