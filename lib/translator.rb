require 'yaml'
file_path = 'lib/emoticons.yml'
def load_library(file_path)
  emoticons = {"get_emoticon" => {}, "get_meaning" => {} }
  library = YAML.load_file(file_path)
  library.each do |meaning, symbol|
    emoticons["get_emoticon"][symbol.first] = symbol.last
    emoticons["get_meaning"][symbol.last] = meaning
  end 
  emoticons
end 
    

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  result = emoticons["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found"
  end 
  result
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  result = emoticons["get_meaning"][emoticon]
  if result == nil 
    result = "Sorry, that emoticon was not found"
  end
  result
end