require 'pi_piper'

puts "Please don't push the button."
count = 0

PiPiper.watch :pin => 18, :invert => true, :direction => :in  do
	count += 1
	if count < 5
		puts "I asked nicely, please don't push the button."
	elsif count >=5 && count < 10
		puts "Dude, please stop."
	elsif count >= 10 && count < 15
		puts "plz no :("
	else
		puts "u r the worst T_T"
	end
end

PiPiper.wait
