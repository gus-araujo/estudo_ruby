class Meeting
    attr_accessor :id, :name, :duration
    @@count = 0
    
    def initialize(name, duration)
        @name = name
        @duration = duration
        @id=@@count+1 
        @@count+=1
    end

    def self.count
        @@count
    end
    def self.id
        @id
    end

    def all
    
    end
end