class Movie
  attr_accessor :name, :quantity, :rented, :categories, :history
  def initialize(name, quant)
    @name = name
    @quantity = quant
    @rented = 0
    @categories = []
    @history = []
  end

  def add_category_at_movie (index)
    @categories << index
  end

  def rented_movie()
  end

end