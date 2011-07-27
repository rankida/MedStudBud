require 'DaCopier'
require 'FileUtils'
require 'ParseWordHtml'

# parameters
src = '/Users/rankida/Dropbox/David & Al/MedStudyBuddy.com/Content/MSB folder hierarchy'
dest = '/Users/rankida/Projects/MedStudBud/public/Notes'
exclude = ["^\\.", ".doc"] # The first element is needed so that '.' and '..' are ignored
template = 'template.mustache'

# Load the chosen mustache template and load it into the transform class
mustacheTemp = File.open(template) { |f| f.read };

def transform src, dest, transformer  
  if src.match(/.htm[l]?$/i)
    transformer.parse src, dest
  elsif
    FileUtils.cp(src, dest)
  end
end

dc = DaCopier.new(exclude)
transformer = ParseWordHtml.new(mustacheTemp)

dc.copy src, dest, lambda {|source, dest| transform source, dest, transformer}

puts 'Fin.'