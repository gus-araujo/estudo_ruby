if !`gem list`.include? 'pg'
    `gem install pg`
end
require 'pg'
`systemctl start postgresql.services`
`psql -U postgres -c "DROP DATABASE solucao;"`
`psql -U postgres -c "DROP USER solucao;"`
`sudo -i -u postgres createuser solucao`
`sudo -i -u postgres createdb solucao`

`psql -U postgres solucao -c "ALTER DATABASE solucao OWNER TO solucao;"`

current_time = 0
max_time = 480
afternoon_session = 180
morning_session = 180

conn = PG.connect(dbname: 'solucao', user: 'solucao')
conn.exec("CREATE TABLE solucao(
    id serial primary key,
    talk VARCHAR,
    duration INTEGER
    )")
conn.exec("CREATE TABLE exclusao(
    id serial primary key,
    talk VARCHAR,
    duration INTEGER
    )")

input = File.open("input.txt")
input.each do |linha|
    if linha.include?"lightning"
    key = linha[0..(linha.length - "lightning".length)]
        conn.exec("INSERT INTO solucao (talk, duration)
            VALUES('#{key}', 5)")
    else 
        key = linha[0...(linha.length)-6]
        value = linha[(linha.length)-6...linha.length]
        value = value.delete("min")
        conn.exec("INSERT INTO solucao (talk, duration)
        VALUES('#{key}', #{value})")
    end
end
puts `psql -U solucao -c "select * from solucao"`


conn.close