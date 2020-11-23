require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
thomas = VentureCapitalist.new("Thomas", 10000000001)
nick = VentureCapitalist.new("Nick", 50000)

hi = Startup.new("hi", thomas, "Amazon")
whoa = Startup.new("whoa", thomas, "Walmart")
cool = Startup.new("cool", nick, "Amazon")

hi.sign_contract(thomas, "bet", 5000000)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line


