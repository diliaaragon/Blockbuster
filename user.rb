class User
  attr_accessor  :name, :id, :movies, :history, :movie
  def initialize(name, id) 
    @name = name
    @id = id
    @movies = [] 
    @movie = 0
    @history = []
  end
end