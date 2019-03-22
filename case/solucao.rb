class Meeting
    attr_accessor :id, :name, :duration
    @@count = 0
    @@names = []
	@@durations = []
	@@all = []
    def initialize(name, duration)
        @name = name
        @duration = duration
        @id=@@count+1 
        @@count+=1
		@@names += [name]
		@@durations += [duration]
		@@all += [[id, name, duration]]
	end

    def self.count	
        @@count
    end
		
	def self.id
        @id
    end
	
	def self.names
		@@names.each do |names|
			puts names
		end
	end
	
	def self.durations
		@@durations.each do |durations|
			puts durations
		end
	end
	def self.all
		@@all
    end
    
    def self.delete
        @@all.delete_at(@id-1)
    end

    def self.get_by_id(id)
        self.all[id-1]
    end
end

def load_data
    input = File.open("input.txt")
    input.each do |linha|
        if linha.include?"lightning"
            key = linha[0..(linha.length - "lightning".length-2)].gsub("\n",'')
            Meeting.new(key, 5)
        else 
            key = linha[0...(linha.length)-6]
            value = linha[(linha.length)-6...linha.length].strip
            value = value.delete("min").strip.to_i
            Meeting.new(key, value)
        end
    end
end

class Calendar < Meeting
end

def create_calendar
    current_time = 0
    max_time = 480
    afternoon_session = 180 
    morning_session = 180

    if current_time == 180 
        current_time = 240
    end        
    
    durations = []

    Meeting.all.each do |id, name, duration|
        durations[id-1] = {"id" => id, "duration"=>duration}
    end


end