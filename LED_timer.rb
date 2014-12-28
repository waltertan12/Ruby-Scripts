require 'pi_piper'

# Initialize
red = PiPiper::Pin.new(:pin => 17, :direction => :out)
yellow = PiPiper::Pin.new(:pin => 12, :direction => :out)
green = PiPiper::Pin.new(:pin => 22, :direction => :out)
button = PiPiper::Pin.new(:pin => 18, :invert => true)
count = 0
puts button.read
wake = "WAKE DA FAHK AHP "

# Get value
puts "How many seconds do you want to wait?"
value = gets.to_i

# Data validation
while value < 1 || false == (value.is_a? Integer)
	if count < 4
		puts "Please type in a positive integer."
		value = gets.to_i
		count += 1
	else
		puts "An integer is a number like 1, 2, 3, 4. Not whatever you were typing..."
		value = gets.to_i
	end
end

# Countdown
countdown = value

value.times do
	if countdown > 5
		green.on
		sleep 0.5
		green.off
		sleep 0.5
		countdown -= 1
	elsif countdown > 3 && countdown < 6
		yellow.on
		sleep 0.5
		yellow.off
		sleep 0.5
		countdown -= 1
	else
		red.on
		sleep 0.25
		red.off
		sleep 0.25
		red.on
		sleep 0.25
		red.off
		sleep 0.25
		countdown -= 1
	end
	puts countdown
end


# Alarm
until button.read == 1
	puts wake
	green.on
	yellow.on
	red.on
	sleep 0.25
	green.off
	yellow.off
	red.off
	sleep 0.25
	green.on
	yellow.on
	red.on
	sleep 0.25
	green.off
	yellow.off
	red.off
	sleep 0.25
end