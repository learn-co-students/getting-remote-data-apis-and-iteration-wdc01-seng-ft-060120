require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request


  response_string = RestClient.get('http://swapi.dev/api/people')
  response_hash = JSON.parse(response_string)
  film_urls = []  
  response_hash["results"].each do |result|
    if result['name'] == character_name
      film_urls = result['films']
    end
  end
  films = film_urls.map do |url|
    film_string = RestClient.get(url)
    film_hash = JSON.parse(film_string)
  end

  
end

def print_movies(films)
  films.each_with_index do |film, index|
    puts "#{index+1}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end


