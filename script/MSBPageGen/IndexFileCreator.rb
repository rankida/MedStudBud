require 'rubygems'
require 'mustache'
require 'cgi'
require 'FileUtils'

class IndexFileCreator

  def initialize(root_dir)
    @root_dir = root_dir
  end

  def gen template, dir_path = @root_dir
    results = []
    Dir.foreach(dir_path) do |f|
      link = f
      
      if f == '.' || f == '..' || f == "index.html"
        next
      elsif File.directory?(dir_path + '/' + f)
        link = CGI.escape(f) + '/'
        gen template, File.join(dir_path, f)
      end
      
      results.push({
        "link" => link,
        "link_text" => f})
    end
    
    resultingText = Mustache.render(template, 
                        :content => results,
                        :style => "",
                        :title => "Index listing of " + File.basename(dir_path))
    File.open(dir_path + '/index.html', 'w') {|f| f.write(resultingText)}
  end

end

dir_path = '/Users/rankida/Projects/MedStudBud/public/Notes'
template = 'index.mustache'

# Load the chosen mustache template and load it into the transform class
mustacheTemp = File.open(template) { |f| f.read };

ifc = IndexFileCreator.new(dir_path)
ifc.gen mustacheTemp


