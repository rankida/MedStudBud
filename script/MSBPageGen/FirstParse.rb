require 'rubygems'
require 'nokogiri'

puts 'Lets start some fun'
html_doc = Nokogiri::HTML("<html><head></head><body><h1>Mr. Belvedere Fan Club</h1><div>Content</div></body></html>")

puts "The body, ladies and gents:"
puts html_doc.css('body');

# change content of tag
html_doc.css('head')

puts 'Fun over - go home'