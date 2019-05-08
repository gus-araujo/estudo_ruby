class Meeting
	attr_accessor  :name, :duration, :value
	@@all = []
	@@names = []
	@@durations = []
	@@values = []
	def initialize(name, duration)
		@name = name
		@duration = duration
		@value = duration/5
		@@all << self
		@@names << name
		@@durations << duration
		@@values << @value
	end

	def self.all
		@@all
	end

	def self.names	
		@@names
	end

	def self.durations
		@@durations
	end

	def self.count
		@@all.length
	end

	def self.values
		@@values
	end

end


class ProcessInput

	def initialize(filename)
		raise "File does not exist" unless File.exists? filename
		@file = File.open(filename)
	end

	def process
			@file.each do |line|
					if line.include? "lightning"
							key = line.gsub("lightning", "").strip
							Meeting.new(key, 5)
					else
							key = line.gsub(/\d.*/, "").strip
							value = line.gsub(/\D/,"").to_i
							Meeting.new(key, value)
					end
			end
	end
end

file = ProcessInput.new("input.txt")
file.process

SESSIONS_MIN = 180


def create_calendar
	table = [[]]
	num_meetings = Meeting.count 
	num_meetings.times do |i|
		table[i] = []
	end

	num_meetings.times do |i|
	 table[i][0] = 0 
	end

	SESSIONS_MIN.times do |i|
		table[0][i] = 0
	end

	for i in 0..num_meetings-1
		for j in 0..SESSIONS_MIN-1
			if Meeting.all[i].duration < j && i > 0
				table[i][j] = Meeting.all[i].value + table[i-1][j-i]
			elsif i>0
				table[i][j] = table[i-1][j]
			else
				table[i][j] = 0 
			end
		end
	end 

	meetings = []

	for i in (Meeting.count-1).downto(0)
		for j in SESSIONS_MIN.downto(0)
			if table[i][j] != table[i-1][j]
				meetings << Meeting.all[i] 
				j = j-Meeting.all[i].duration
			end
		end
	end
	
	return meetings

end