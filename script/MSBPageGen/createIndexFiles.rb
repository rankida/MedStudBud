require 'FileUtils'

class IndexFileCreator

  def initialize(root_dir)
    @root_dir = root_dir
  end

  def gen
    r = []
    Dir.foreach(@root_dir) do |f|
      r.push f
    end
    File.open(@root_dir + '/index.html', 'w') {|f| r.each{|r| f.write(r + "\n")}}
  end

end

dir_path = '/Users/rankida/Projects/MedStudBud/public/Notes'
ifc = IndexFileCreator.new(dir_path)
ifc.gen


