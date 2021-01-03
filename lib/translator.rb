require "yaml"

def load_library(yaml_file_path)
    yaml_file_path = YAML.load_file(yaml_file_path)
    hash = {
        "get_meaning" => {},
        "get_emoticon" => {}
    }
    yaml_file_path.each do |meaning, array_emoticons| 
        # p array_emoticons
        hash["get_meaning"][array_emoticons[1]] = meaning
        hash["get_emoticon"][array_emoticons[0]] = array_emoticons[1]

        # array_emoticons.each do |emoticons|
        #     p emoticons
        # end
    end
    hash
end



def get_japanese_emoticon(yaml_file_path, eng_emoticon)
    hash_library = load_library(yaml_file_path)
    if hash_library["get_emoticon"][eng_emoticon]
        hash_library["get_emoticon"][eng_emoticon]
    else
        "Sorry, that emoticon was not found"
    end
end



def get_english_meaning(yaml_file_path, jpn_emoticon)
    hash_library = load_library(yaml_file_path)
    if hash_library["get_meaning"][jpn_emoticon] 
        hash_library["get_meaning"][jpn_emoticon] 
    else
        "Sorry, that emoticon was not found"
    end 
end



