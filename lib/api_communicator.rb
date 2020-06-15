require 'rest-client'
require 'json'
require 'pry'

def show_character_movies(character)
  character_films = get_character_movies_from_api(character)
  print_movies(character_films)
end

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  character_hash = response_hash['results'].find {|char| char['name'].downcase == character_name}

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  films = character_hash['films']

  character_films = films.map do |film|
    film_string = RestClient.get(film)
    film_hash = JSON.parse(film_string)
    film_hash['title']
  end

  return character_films

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  #  this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(character_films)
  # some iteration magic and puts out the movies in a nice list

  character_films.each_with_index do |film, index|
    puts "#{index + 1}. #{film}"
  end
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
