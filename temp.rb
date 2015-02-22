require 'sqlite3'
require 'time'

def get_temp
	
	raw_temp = ""
	file = File.new("/sys/bus/w1/devices/28-0000065d9c99/w1_slave","r")
	while (line = file.gets)
        	if line['t=']
			start = line.index('t=') + 2
			temp = line[start...-1].to_f
			temp = ((temp / 1000) * (9.0 / 5.0) + 32.0).round(1)
		end
	end
	file.close
	return temp
end

puts get_temp
puts Time.now

begin
	db = SQLite3::Database.new "temp.db"
	db.execute "INSERT INTO tbl VALUES (?, ?);", [get_temp, Time.now.to_s]
rescue SQLite3::Exception => e
	puts "Exception occurred"
	puts e
ensure
	db.close if db
end
