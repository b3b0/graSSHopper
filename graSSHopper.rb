puts `clear`

puts <<-'EOF'
               ┌─┐┬─┐┌─┐╔═╗╔═╗╦ ╦┌─┐┌─┐┌─┐┌─┐┬─┐
               │ ┬├┬┘├─┤╚═╗╚═╗╠═╣│ │├─┘├─┘├┤ ├┬┘
               └─┘┴└─┴ ┴╚═╝╚═╝╩ ╩└─┘┴  ┴  └─┘┴└─                   
                       -----------------
** MAKE SURE TO SETUP commands.cfg and servers.cfg BEFORE PROCEEDING **
        ------------------------------------------------------
EOF

sleep(2)



  #
 #  # 
#    #
heart = File.read('commands.cfg')
#    #
 #  #
   #

brain = File.readlines('servers.cfg').map do |line|
    k, *v = line.split(',').map(&:strip)
    [k, v]
end.to_h

def sshsetup(servers)
    system("echo "" > servers.meta")
    system("ssh-keygen")
    servers.each do |sshserver, username, port|
        print ("Username for #{sshserver}?")
        username = gets.chomp
        print ("Port for #{sshserver}?")
        port = gets.chomp
        open('servers.meta', 'a') do |f|
            f.puts ("#{sshserver}, #{username}, #{port}")
            system("ssh-copy-id -p #{port} #{username}@#{sshserver}")
          end 
        end
    puts "Generate running config?"
    answer = gets.chomp
    if answer == "y"
        system("cp -f servers.meta servers.cfg")
    end
    puts "Keygen process completed."
    sleep(2)
end

print("Do you need to run the ssh-keygen setup? Requires you to have correctly configured your servers.cfg file. [y/n] ")
sshsetup = gets.chomp
if sshsetup == 'y'
    sshsetup(brain)
elsif
    puts "Continuing without ssh key generation."
end

puts `date >> checker.txt`
puts `echo "---------------------" >> checker.txt`
puts `echo "Command: #{heart}" >> checker.txt`
puts `echo "---------------------" >> checker.txt`

brain.each do |server, settings|
    puts "Scanning #{server}"
    puts `echo "#{server}" >> checker.txt`
    user = settings[0]
    port = settings[1]
    system("ssh -p #{port} #{user}@#{server} '( #{heart} )' >> checker.txt ")
    puts `echo "______" >> checker.txt`
    puts `clear`
end

puts `echo "~-~-~-~-~-~END OF THIS CHECKING SESSION~-~-~-~-~-~" >> checker.txt`

system("cat checker.txt")
