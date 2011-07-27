require 'rubygems'
require 'nokogiri'
require 'mustache'

class ParseWordHtml
  
  def initialize(t)
    @template = t
  end
  
  def parse src, dest
    # Read html using Nokogiri
    inputFile = File.open(src)
    doc = Nokogiri::HTML(inputFile)
    inputFile.close
    
    # Get the important content from the file
    wordDiv = doc.at_css('div.WordSection1') # same as div.css('div.WordSection1').first
    wordStyle = doc.at_css('style');
    
    content = wordDiv.to_html
    resultingText = Mustache.render(@template, 
                        :content => content,
                        :style => wordStyle.to_html,
                        :title => "Title")
    File.open(dest, 'w') {|f| f.write(resultingText)}
  end
end