class File
  def initialize(name, content = '')
    @name = name
    @content = content
  end
end

class Directory

  attr_reader :content

  def initialize(name)
    @name = name
    @content = {}
  end

end

class FileSystem
  attr_reader :root_dir

  def initialize
    @root_dir = Directory.new('root')
  end

  def ls(path)
    if path == '/'
      root_dir.content.keys
    end
  end
end

class NameFilter

  def is_valid?(file, name)
    return true if name.nil?

    file.name == name
  end
end

class SizeFilter

  def is_valid?(file, size)
    return true if size.nil?

    file.content.size == size
  end
end

class FileFilter
  FILTERS = [
    {class: 'NameFilter', input: 'name'},
    {class: 'SizeFilter', input: 'size'}
  ]
  def is_valid?(file, params)
    FILTERS.each do |class_name, input_name|
      klass = class_name.capitalize.classify
      valid = klass.valid?(file, params[input_name])
      return false unless valid
    end
    true
  end
end

class FileSearcher

  def self.call(root, params)
    new(root, params).call
  end

  def initialize(root, params)
    @root = root
    @input = params
    @filter = FileFilter.new
  end

  def call
    files = get_files
    result = []
    files.each do |file|
      result << file if @filter.is_valid?(file, @params)
    end
    result
  end

  def get_files
    # using Queue
  end
end

# Find API similar to UNIX
def find(root, params)
  FileSearcher.call(root, params)
end