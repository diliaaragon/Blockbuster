require './categories'
require './movie'

class Store

  def initialize
    @categories = []
    @movies = []
  end

  def add_category(name)
    p = Categories.new(name)
    @categories << p
  end

  def list_category
    @categories.each_with_index do |category, index|
      name = category.name
      puts "#{index}. #{name}"
    end
  end

  def delete_category(index)
    @categories.delete_at(index)
  end

  def edit_category(index, name)
    @categories[index].name = name
  end 

  def add_movie(name, quant)
    p = Movie.new(name, quant)
    @movies << p
  end

  def list_movie
    @movies.each_with_index do |movie, index|
      name = movie.name
      puts "#{index}. #{name}"
    end
  end

  def delete_movie(index)
    @movies.delete_at(index)
  end

  def edit_movie(name, quant, index)
    @movies[index].name = name
    @movies[index].quantity += quant
  end
end