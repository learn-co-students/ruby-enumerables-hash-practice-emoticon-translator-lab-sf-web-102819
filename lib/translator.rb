# require modules here
require 'yaml'

def load_library(file)
  result = YAML.load_file(file)
  
  new_hash = {}
  sub_hash = {}
  sub_hash2 = {}
  
 result.each do |k, v|
    sub_hash[v[1]] = k
  end
  
  result.each do |key, value|
    sub_hash2[value[0]] = value[1]
  end
  
  new_hash[:get_emoticon] = sub_hash2
  new_hash[:get_meaning] = sub_hash
  
  return new_hash
end


def get_japanese_emoticon(file, emoticon)
  data = load_library(file)
  result = data[:get_emoticon][emoticon]
  if result == nil 
    return "Sorry, that emoticon was not found"
  end
  return result
end

def get_english_meaning(file, emoticon)
  data = load_library(file)
  result = data[:get_meaning][emoticon]
  if result == nil 
    return "Sorry, that emoticon was not found"
  end
  return result
  
end