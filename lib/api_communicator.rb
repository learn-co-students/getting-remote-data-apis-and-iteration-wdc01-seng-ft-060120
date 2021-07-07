require 'rest-client'
require 'json'
require 'pry'

#returns info hash of films by character_name
def get_character_movies_from_api(character_name)
  
  #make the web request
  all_info = get_json_hash('http://swapi.dev/api/people')  
  
  #gets array of urls pointing to each movie  
  film_urls = []
  all_info["results"].each do |result|
    if result['name'] == character_name
      film_urls = result['films']
    end
  end  
  #retrieves movie hash from each film_url(s)
  film_urls.map do |url|
    get_json_hash(url)
  end  
end



#numbers and prints title of each json hash
def print_movies(films)
  films.each_with_index do |film, index|
    puts "#{index+1}. #{film["title"]}"
  end
end

#helper
def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

#returns array of [results] from json hash
def get_json_hash(api_link)
  response_string = RestClient.get(api_link)
  response_hash = JSON.parse(response_string)   
end

def show_movie_info(movie,hash_key)
  if hash_key == '-all'
    all_info = get_json_hash("https://swapi.dev/api/films")
    all_info['results'].each do |movie_hash|
      if movie_hash['title'] == movie
        movie_hash.each do |hash_val|
          if !hash_val.is_a? Array
            puts hash_val
        end
      end
    end
  end

end

