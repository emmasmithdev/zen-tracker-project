class Country

  attr_reader :id, :name, :continent_id
  attr_accessor :visited

  def initialize(options)
    @id = options["id"] if options["id"]
    @name = options["name"]
    @visited = options["visited"]
    @continent_id = options["continent_id"]
  end

  def continent
    
  end

end
