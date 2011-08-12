require 'FileUtils'

dir_path = '/Users/rankida/Projects/MedStudBud/public/Notes'

class Results
  attr_accessor :file_name
  attr_accessor :is_dir
  attr_accessor :dir_exists
  attr_accessor :html
end

# Get all the data and store it in an array called r
r = []

Dir.foreach(dir_path) do |f|
  spec = Results.new
  spec.file_name = f
  spec.is_dir = File.directory?(f)
  #spec.dir_exists = Dir.exist?(f)
  spec.html = f.match(/\.html|$/i) || f.match(/\.htm|$/i)
  r.push spec
end

longestName = r.max_by {|x| x.file_name.length }
puts "max = " + longestName.file_name



