
Dir.foreach('/Users/rankida/Projects/MedStudBud/public/Notes') do |f|
   if File.directory?(f) || Dir.exist?(f)
    puts '[] ' + f
  else
    puts ' `-> ' + f
  end
end

def getHtml(directoryName = "")
  files = Dir[directoryName + "*.{html,htm}"]
  files.each { |name| puts "=> " + name }
end

puts "Type something and I'll read it out again"
line = gets
puts "=> " + line
puts "Html files in this dir - ruby style"
getHtml()

