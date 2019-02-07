class User
  attr_accessor  :name, :id, :movies, :history
  def initialize(name, id) 
    @name = name
    @id = id
    @movies = [] 
    @history = []
  end
end