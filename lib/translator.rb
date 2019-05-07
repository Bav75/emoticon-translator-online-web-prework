# require modules here
require "yaml"

def load_library(filepath)
  yaml_file = YAML.load_file(filepath)

  emoticons = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  yaml_file.each do |emotion, content|
    emoticons["get_meaning"][content[1]] = emotion
    emoticons["get_emoticon"][content[0]] = content[1]
  end
  emoticons
end

def get_japanese_emoticon(filepath, emoticon)
  emoticons = load_library(filepath)
  result = emoticons["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(filepath, emoticon)
  emoticons = load_library(filepath)
  result = emoticons["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end