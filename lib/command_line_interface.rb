def welcome
  # puts out a welcome message here!
  puts "Welcome to our Star Wars character & movie database search!"
  puts "You can enter a character of your choice and get which movies the character was in!"
end

def get_character_from_user
  puts "Please enter a character name:"
  character = gets.chomp().downcase 
  # use gets to capture the user's input. This method should return that input, downcased.
end
