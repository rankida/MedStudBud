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
  spec.is_dir = File.directory?(dir_path + '/' + f)
  #spec.dir_exists = Dir.exist?(f)
  spec.html = f.match(/\.html|$/i) != nil || f.match(/\.htm|$/i) != nil
  r.push spec
end

puts "Listing for " + dir_path
puts
puts

longestName = r.max_by {|x| x.file_name.length }

puts "   #{'File Name'.ljust(longestName.file_name.length)} |  Html  | is Dir |  |"
puts "   #{'---------'.ljust(longestName.file_name.length, '-')} |  ----  | ------ | -|"

r.each do |result|
  puts " - #{result.file_name.ljust(longestName.file_name.length)} | #{result.html.to_s.ljust(6)} | #{result.is_dir.to_s.ljust(6)} | #{result.dir_exists} | "
end



