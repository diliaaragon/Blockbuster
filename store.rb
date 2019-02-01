require './categories'
class Store

  def initialize
    @categories = []
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
    puts @categories[index]
    @categories[index].name = name
  end 
end