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

 def get_japanese_emoticon(file_path, emoticon)
   hash = load_library(file_path)
   hash["get_emoticon"].each do |eng,jap|
     if eng == emoticon
       return jap
       break
     end
   end
   "Sorry, that emoticon was not found"
 end

 def get_english_meaning(file_path, emoticon)
   hash = load_library(file_path)
   hash["get_meaning"].each do |jap_emot,meaning|
     if jap_emot == emoticon
       return meaning
       break
     end
   end
   "Sorry, that emoticon was not found"
 end
