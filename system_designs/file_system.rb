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

  def add(content)

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