if !`gem list`.include? 'pg'
    `gem install pg`
end
require 'pg'
`sudo -i -u postgres createuser solucao`
`sudo -i -u postgres createdb solucao`
`psql -U postgres solucao -c "ALTER DATABASE solucao OWNER TO solucao;"`

conn = PG.connect(dbname: 'solucao', user: 'solucao')
conn.exec("CREATE TABLE solucao(
    id serial primary key,
    talk VARCHAR,
    duration INTEGER
    )")

input = File.open("input.txt")
input.each do |linha|
    if linha.include?"lightning"
    linha = linha.delete('lightning')
        conn.exec("INSERT INTO solucao (talk, duration)
            VALUES('#{linha}', 5)")
    else 
        key = linha[0...(linha.length)-6]
        value = linha[(linha.length)-6...linha.length]
        value = value.delete('min').to_i
        puts value
        #conn.exec("INSERT INTO solucao VALUES('#{key}', #{value})")
    end

end

talks.sort.values