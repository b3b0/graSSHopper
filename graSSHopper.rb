$brain = "empty"
heart = File.read('/usr/share/grasshopper/commands.cfg')

def think()
    $brain = File.readlines('/usr/share/grasshopper/servers.cfg').map do |line|
        k, *v = line.split(',').map(&:strip)
        [k, v]
    end.to_h
end

def sshsetup(servers)
    system("rm /usr/share/grasshopper/servers.meta")
    system("ssh-keygen")
    print("Generate new servers.cfg [y] or use current one [n]? ")
    choice = gets.chomp
    if choice == "y"
        creating = true
        while creating == true
            print ("Servername?")
            sshserver = gets.chomp
            print ("Username?")
            username = gets.chomp
            print ("Port for #{sshserver}?")
            port = gets.chomp
            open('/usr/share/grasshopper/servers.meta', 'a') do |f|
                f.puts ("#{sshserver}, #{username}, #{port}")
                system("ssh-copy-id -p #{port} #{username}@#{sshserver}")
            end
            puts("add another server?")
            addanother = gets.chomp
            if addanother != "y"
                creating = false
            end
        end
    else
        servers.each do |server, settings|
            user = settings[0]
            port = settings[1]
            system("ssh-copy-id -p #{port} #{user}@#{server}")
        end
    end
    
    puts "Generate running config?"
    answer = gets.chomp
    if answer == "y"
        system("cp -f /usr/share/grasshopper/servers.meta /usr/share/grasshopper/servers.cfg")
    end
    
    puts "Keygen process completed."
    sleep(2)
end

puts `clear`
puts <<-'EOF'               
┌─┐┬─┐┌─┐╔═╗╔═╗╦ ╦┌─┐┌─┐┌─┐┌─┐┬─┐
│ ┬├┬┘├─┤╚═╗╚═╗╠═╣│ │├─┘├─┘├┤ ├┬┘
└─┘┴└─┴ ┴╚═╝╚═╝╩ ╩└─┘┴  ┴  └─┘┴└─  
|----------------------------------|
** MAKE SURE TO SETUP commands.cfg**
** and servers.cfg BEFORE PROCEED **
** ING, FOR YOUR OWN SAFETY   <3  **
|----------------------------------|
EOF

sleep(2)
print("Do you need to run the ssh-keygen setup? Requires you to have correctly configured your servers.cfg file. [y/n] ")
sshsetup = gets.chomp
if sshsetup == 'y'
    think()
    sshsetup($brain)
elsif
    puts "Continuing without ssh key generation."
end

puts `date >> /usr/share/grasshopper/checker.txt`
puts `echo "---------------------" >> /usr/share/grasshopper/checker.txt`
puts `echo "Command: #{heart}" >> /usr/share/grasshopper/checker.txt`
puts `echo "---------------------" >> /usr/share/grasshopper/checker.txt`

think()
puts `clear`
puts "Command:"
print "--------:"
what = gets.chomp
$brain.each do |server, settings|
    puts "Nuking #{server}"
    puts `echo "#{server}" >> /usr/share/grasshopper/checker.txt`
    user = settings[0]
    port = settings[1]
    system("ssh -t -p #{port} #{user}@#{server} '( #{what} )' | tee -a /usr/share/grasshopper/checker.txt ")
    puts `echo "______" >> /usr/share/grasshopper/checker.txt`
    puts `clear`
end

puts `echo "~-~-~-~-~-~END OF THIS CHECKING SESSION~-~-~-~-~-~" >> /usr/share/grasshopper/checker.txt`

system("cat /usr/share/grasshopper/checker.txt")
