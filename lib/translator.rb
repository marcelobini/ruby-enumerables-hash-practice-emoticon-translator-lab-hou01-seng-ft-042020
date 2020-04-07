# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  emoticons = YAML.load_file(file)
  new_hash = {}

  emoticons.each do |key,value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end

  new_hash
end

def get_japanese_emoticon(library, emoticon)
   # code goes here
   dictionary = load_library(library)
   return "Sorry, that emoticon was not found" if dictionary["get_emoticon"][emoticon].nil?
   dictionary["get_emoticon"][emoticon]
 end		 

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  emoji = emoticons.find {|name, faces| faces[1] == emoticon }
  emoji == nil ? "Sorry, that emoticon was not found" : emoji[0]
end
