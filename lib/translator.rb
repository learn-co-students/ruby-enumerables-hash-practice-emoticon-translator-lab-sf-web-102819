require "pry"
# require modules here
require "yaml"

def load_library(path)
  #INPUT: HoA (1hash w/ array as val)
  hash = {}
  emoticons = YAML.load_file(path)
  hash["get_meaning"] = {}
  hash["get_emoticon"] = {}
  
  emoticons.each do |jp_meaning, arr|
    # binding.pry
    hash["get_meaning"][arr[1]] = jp_meaning
  end
  emoticons.each do |eng_meaning, arr|
    # hash["get_emoticon"][arr[0]] = eng_meaning
    hash["get_emoticon"][arr[0]] = arr[1]
  end
  # hash[:get_meaning][emoticons.keys[0]] = emoticons.keys[0][1]
  hash
end

def get_japanese_emoticon(path, emoticon)
  hash = load_library(path)
  hash_keys = hash["get_emoticon"].keys
  if hash_keys.include?(emoticon)
    return hash["get_emoticon"][emoticon]
  end 
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  hash = load_library(path)
  hash_keys = hash["get_meaning"].keys
  if hash_keys.include?(emoticon)
    return hash["get_meaning"][emoticon]
  end 
  "Sorry, that emoticon was not found"
end