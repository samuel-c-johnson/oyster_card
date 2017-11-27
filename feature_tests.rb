require './lib/oystercard.rb'

card = OysterCard.new
p card.balance            #should equal 0
card.top_up(20)
p card.balance
# card.top_up(100)
# p card.balance
card.deduct(5)
card.balance
card.touch_in
p card.in_journey?
p card.touch_out
p card.in_journey? 
