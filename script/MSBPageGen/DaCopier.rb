require 'FileUtils'

# This is based on a blog: http://iamneato.com/2009/07/28/copy-folders-recursively

class DaCopier

  def initialize(exclude)
    @exclude = exclude
  end

  def copy src, dest, copyFunc

    count = 0
    stage dest

    Dir.foreach(src) do |file|
      next if exclude?(file)

      s = File.join(src, file)
      d = File.join(dest, file)
      
      #puts "Copy:: #{s} -> #{d}"

      if File.directory?(s)
        FileUtils.mkdir(d)
        copy s, d, copyFunc # recurrsion :)
      else
        copyFunc == nil ? FileUtils.cp(s, d) : copyFunc.call(s, d)
      end
    end

  end

  def stage dest
    if File.directory?(dest)
      FileUtils.rm_rf(dest)
    end
    FileUtils.mkdir(dest)
  end

  def exclude? file
    @exclude.each do |s|
      if file.match(/#{s}/i) # If text in array appears in file name (case insensitive)
        #puts "Excluding #{file} as it matches patter '#{s}'"
        return true
      end
    end
    false
  end
end
