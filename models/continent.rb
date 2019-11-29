class Continent

  attr_reader :id, :name, :size
  attr_accessor :visited

def initialize(options)
  @id = options["id"] if options["id"]
  @name = options["name"]
  @visited = options["visited"]
  @size = options["size"]
end

end
