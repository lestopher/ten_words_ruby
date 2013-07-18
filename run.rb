#!/usr/env/bin ruby

require File.join(File.dirname(__FILE__), 'lib/ten_words.rb')

fileName = ARGV[0] if ARGV.length > 0
fileName ||= "declaration"

filePath = {
  "declaration" => "data/declaration_of_independence.txt",
  "constitution" => "data/constitution.txt"
}

begin
  file = File.open filePath[fileName], 'rb'
  text = file.read
  file.close
rescue
  raise "FileDoesNotExist"
end

tw   = TenWords.new :data => text
puts tw.get_top_ten_words true
