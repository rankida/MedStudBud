
def getHtml(directoryName = "")
  files = Dir[directoryName + "*.{html,htm}"]
  files.each { |name| puts "=> " + name }
end

puts "Type something and I'll read it out again"
line = gets
puts "=> " + line
puts "Html files in this dir - ruby style"
getHtml()

