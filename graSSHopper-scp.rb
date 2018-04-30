$brain = "empty"

def think()
    $brain = File.readlines('/usr/share/grasshopper/servers.cfg').map do |line|
        k, *v = line.split(',').map(&:strip)
        [k, v]
    end.to_h
end

puts `clear`
puts <<-'EOF'               
┌─┐┬─┐┌─┐╔═╗╔═╗╦ ╦┌─┐┌─┐┌─┐┌─┐┬─┐
│ ┬├┬┘├─┤╚═╗╚═╗╠═╣│ │├─┘├─┘├┤ ├┬┘
└─┘┴└─┴ ┴╚═╝╚═╝╩ ╩└─┘┴  ┴  └─┘┴└─  
|----------------------------------|
**           SCP TOOL             **
|----------------------------------|
EOF

think()

puts `clear`
puts "Source file or folder:"
print "--------:"
source = gets.chomp
puts "Destination file or folder:"
print "--------:"
dest = gets.chomp
print "Is the remote server the source? "
remotesrc = gets.chomp
puts "Add your options here (-r, etc...):"
print "--------:"
options = gets.chomp
$brain.each do |server, settings|
    puts "Nuking #{server}"
    puts `echo "#{server}" >> /usr/share/grasshopper/checker.txt`
    user = settings[0]
    port = settings[1]
    if remotesrc == "y"
        system("scp -P #{port} #{options} #{user}@#{server}:#{source} #{dest}")
    else
        system("scp -P #{port} #{options} #{source} #{user}@#{server}:#{dest}")
    end
end
