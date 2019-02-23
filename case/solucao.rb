input = File.open("input.txt")
talks = {}
input.each do |linha|
    if linha.include?"lightning"
        linha.tr("lightning","")
        talks.store(linha,"5min") 
    else 
        key = linha[0...(linha.length)-6]
        value = linha[(linha.length)-6...linha.length]
        talks.store(key,value) 
    end

end

talks.sort.values