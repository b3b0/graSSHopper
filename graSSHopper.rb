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
brain = Hash[*File.read('servers.cfg').split(/[, \n]+/)]
#    # 
 #  # 
   #
 #  # 
#    #
heart = File.read('commands.cfg')
#    #
 #  #
   #

   
def sshsetup(servers)
    system("echo "" > servers.meta")
    system("ssh-keygen")
    servers.each do |sshserver, username|
        print ("Username for #{sshserver}?")
        username = gets.chomp
        open('servers.meta', 'a') do |f|
            f.puts ("#{sshserver}, #{username}")
            system("ssh-copy-id #{username}@#{sshserver}")
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

brain.each do |server, user|
    puts "Scanning #{server}"
    puts `echo "#{server}" >> checker.txt`
    system("ssh #{user}@#{server} '( #{heart} )' >> checker.txt ")
    puts `echo "______" >> checker.txt`
    puts `clear`
end

puts `echo "~-~-~-~-~-~END OF THIS CHECKING SESSION~-~-~-~-~-~" >> checker.txt`

system("cat checker.txt")
