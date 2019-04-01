class Meeting
	attr_accessor  :name, :duration

	def initialize(name, duration)
		@name = name
		@duration = duration
	end

end


class ProcessInput

	def initialize(filename)
		raise "File does not exist" unless File.exists? filename
		@file = File.open(filename)
	end

	def process
			@meetings = []
			@file.each do |line|
					if line.include? "lightning"
							key = line.gsub("lightning", "").strip
							@meetings << Meeting.new(key, 5)
					else
							key = line.gsub(/\d.*/, "").strip
							value = line.gsub(/\D/,"").to_i
							@meetings << Meeting.new(key, value)
					end
			end
	end

	def meetings
			@meetings
	end

end

file = ProcessInput.new("input.txt")
file.process

MAX_TIME_MINUTES = 480
AFTERNOON_SESSION_MINUTES = 180
MORNING_SESSION_MINUTES = 180
def create_calendar(file)

	current_time_minutes = 0
	current_time_hours = 9
	full_time = 0

	durations = Hash.new
	file.meetings.each do |meeting|
			durations[meeting.name] = meeting.duration
	end

	durations = durations.sort_by{|name, duration| duration}
	prefix = "AM"
	
	durations.each do |name, duration|
			final_current_time_hours = ""
			final_current_time_minutes = ""

			if current_time_hours == 12
					current_time_hours = 1
					afternoon = true
			end

			if afternoon
					prefix = "PM"
			end

			if current_time_minutes < 10
				final_current_time_minutes = "0" + current_time_minutes.to_s
			else 
				final_current_time_minutes = current_time_minutes.to_s
			end

			if current_time_hours < 10
				final_current_time_hours = "0" + current_time_hours.to_s 
			else
				final_current_time_hours = current_time_hours.to_s
			end
			
			puts final_current_time_hours + ":" + final_current_time_minutes + ' ' + prefix + ' ' + name

			current_time_minutes += duration
			
			if current_time_minutes >= 60
					current_time_hours += 1
					current_time_minutes = current_time_minutes - 60
			end
	end
end