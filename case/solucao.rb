require 'main'
current_time = 0
max_time = 480
afternoon_session = 180
morning_session = 180

input = File.open("input.txt")
input.each do |linha|
    if linha.include?"lightning"
        key = linha[0..(linha.length - "lightning".length)]
        Meeting.new(key, 5)
    else 
        key = linha[0...(linha.length)-6]
        value = linha[(linha.length)-6...linha.length]
        value = value.delete("min")
        Meeting.new(key, value)        
    end
end