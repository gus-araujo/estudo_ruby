class Meeting
    attr_accessor  :name, :duration

    def initialize(name, duration)
        @name = name
        @duration = duration
	end
class ClassName
    
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


MAX_TIME_MINUTES = 480
AFTERNOON_SESSION_MINUTES = 180 
MORNING_SESSION_MINUTES = 180
def create_calendar
    current_time_minutes = 0

    if current_time_minutes == 180 
        current_time_minutes = 240
    end        
    
    durations = Hash.new
    Meeting.all.each do |name, duration|
        durations << = {key:meetings.name, duration: meetings.duration}
    end


end