class Movie
  attr_accessor :name, :quantity, :rented, :categories, :history
  def initialize(name, quant)
    @name = name
    @quantity = quant
    @rented = 0
    @categories = []
    @history = []
  end
end