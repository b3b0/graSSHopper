$brain = "empty"
heart = File.read('/usr/share/grasshopper/commands.cfg')

def think()
    $brain = File.readlines('/usr/share/grasshopper/servers.cfg').map do |line|
        k, *v = line.split(',').map(&:strip)
        [k, v]
    end.to_h
end

puts `date >> /usr/share/grasshopper/checker.txt`
puts `echo "---------------------" >> /usr/share/grasshopper/checker.txt`
puts `echo "Command: #{heart}" >> /usr/share/grasshopper/checker.txt`
puts `echo "---------------------" >> /usr/share/grasshopper/checker.txt`

think()

$brain.each do |server, settings|
    puts `echo "#{server}" >> /usr/share/grasshopper/checker.txt`
    user = settings[0]
    port = settings[1]
    system("ssh -t -p #{port} #{user}@#{server} '( #{heart} )' >> /usr/share/grasshopper/checker.txt ")
    puts `echo "______" >> /usr/share/grasshopper/checker.txt`
    puts `cat /usr/share/grasshopper/checker.txt > /usr/share/grasshopper/crontab.txt`
end

puts `echo "~-~-~-~-~-~END OF THIS CHECKING SESSION~-~-~-~-~-~" >> /usr/share/grasshopper/checker.txt`
