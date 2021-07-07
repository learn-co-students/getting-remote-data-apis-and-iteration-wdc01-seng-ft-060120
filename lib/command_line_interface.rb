def welcome
  puts "Welcome to the Star Wars API lab"
  puts "Do you want to search character or movie info?"
  puts "type 1 for characters, type 2 for movies"
  user_input = gets.chomp    
end

def cli
  inp = welcome
  if inp == 1
    show_character_movies(get_character_from_user)
  elsif inp == 2
    show_movie_info(get_movie_name_from_user,get_a_hash_key_from_user)
  else
    puts "Error, enter either 1 or 2"
  end
end

def get_character_from_user
  puts "please enter a character name"
  user_input = gets.chomp
end

def get_movie_name_from_user
  puts "please enter a movie name"
  user_input = gets.chomp
end

def get_a_hash_key_from_user
  puts "please enter a property or -all"
  gets.chomp
end



