require 'rubygems'
require 'mustache'
require 'cgi'
require 'FileUtils'

class IndexFileCreator

  def initialize(root_dir)
    @root_dir = root_dir
  end

  def gen template
    r = []
    Dir.foreach(@root_dir) do |f|
      link = f
      
      if f == '.' || f == '..' || f == "index.html"
        next
      elsif File.directory?(@root_dir + '/' + f)
        link = CGI.escape(f) + '/'
      end
      
      r.push({
        "link" => link,
        "link_text" => f})
    end
    
    resultingText = Mustache.render(template, 
                        :content => r,
                        :style => "",
                        :title => "Index listing of " + File.basename(@root_dir))
    File.open(@root_dir + '/index.html', 'w') {|f| f.write(resultingText)}
  end

end

dir_path = '/Users/rankida/Projects/MedStudBud/public/Notes'
template = 'index.mustache'

# Load the chosen mustache template and load it into the transform class
mustacheTemp = File.open(template) { |f| f.read };

ifc = IndexFileCreator.new(dir_path)
ifc.gen mustacheTemp


