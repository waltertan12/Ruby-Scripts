require 'pi_piper'

pin = PiPiper::Pin.new(:pin => 17, :direction => :out)
pin.off

puts "Please don't push the button. We must conserve electricity."
count = 0

response = [
		"I asked nicely, please don't push the button - we will die.",
		"Please, don't be wasteful",
		"The light is an emergency beacon",
		"We have limited battery",
		"Do you have a death wish?",
		"No, I was not implying I'd kill you. You can push the button once becasue I feel bad.",
		"Now no more",
		"You are the worst",
		"Please, I'm begging you",
		"Seriously?",
		"I have a wife and child",
		"I did not know you also have a wife a child. My apologies.",
		"You say, 'It is the simple things in life?'",
		"We are doomed",
		"Battery is at 10%",
		"Battery is at 5%",
		"Battery is at 2%",
		"I'm begging you, stop",
		"Battery is at 1%",
		"You've killed us all", 
		":("]

PiPiper.watch :pin => 18, :invert => true, :direction => :in  do
	if count < 20
		puts "#{response[count]}"
		pin.on
		sleep 0.5
		pin.off
	else
		puts "#{response[20]}"
		sleep 0.2
	end
	count += 1
	
#	if count < 5
#		puts "I asked nicely, please don't push the button or we will die"
#	elsif count >=5 && count < 10
#		puts "Dude, please stop."
#	elsif count >= 10 && count < 15
#		puts "plz no :("
#	else
#		puts "u r the worst becuz we all died"
#	end
	
end

PiPiper.wait
