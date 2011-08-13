require 'DaCopier'
require 'FileUtils'
require 'ParseWordHtml'
require 'IndexFileCreator'

# parameters
src = '/Users/rankida/Dropbox/David & Al/MedStudyBuddy.com/Content/MSB folder hierarchy'
notes_dir = '/Users/rankida/Projects/MedStudBud/public/Notes'
exclude = ["^\\.", ".doc"] # The first element is needed so that '.' and '..' are ignored
template = 'note.mustache'
index_template = 'index.mustache'

# Load the chosen mustache template and load it into the transform class
mustacheTemp = File.open(template) { |f| f.read };

def transform src, notes_dir, transformer  
  if src.match(/.htm[l]?$/i)
    transformer.parse src, notes_dir
  elsif
    FileUtils.cp(src, notes_dir)
  end
end

# Transform notes from drop box word files into html Notes in public/Notes
dc = DaCopier.new(exclude)
transformer = ParseWordHtml.new(mustacheTemp)

dc.copy src, notes_dir, lambda {|source, dest| transform source, dest, transformer}

# Create Index files for all folders in public/Notes
mustacheTemp = File.open(index_template) { |f| f.read };

ifc = IndexFileCreator.new(notes_dir)
ifc.gen mustacheTemp

puts 'Fin.'