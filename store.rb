require './categories'
require './movie'
require './user'

class Store

  def initialize
    @categories = []
    @movies = []
    @users = []
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

  def assign_categories(index_movie, index_category)
    @movies[index_movie].categories << @categories[index_category]
  end

  def add_user(name, id)
    p = User.new(name, id)
    @users << p
  end

  def list_user
    @users.each_with_index do |user, index|
      name = user.name
      id = user.id
      puts "#{index}. #{name} - id: #{id}"
    end
  end

  def delete_user(index)
    @users.delete_at(index)
  end

  def edit_user(name, id, index)
    @users[index].name = name
    @users[index].id = id
  end

  def rented_movie(index_user, index_movie, date)
    user = @users[index_user] 
    movie = @movies[index_movie]
    user.movies << movie
    user.history << movie.name
    @movies[index_movie].rented += 1
    @movies[index_movie].history << "The user #{user.name} rented this movie - date of return: #{date}"
  end

  def return_movie(index, user)
    @movies[index].quantity += 1
    @movies[index].rented -= 1
    @users[user].movies.each do |movie|
      if movie.name == @movies[index].name
        @users[user].movies.delete_at(movie)
      end
    end
  end

  def look_history(index)
    movie = @movies[index]
    puts movie.history
  end

  def list_rented_movies(index)
   user = @users[index]
   puts 'Currently rented movies'
   puts user.movies
   puts 'All movies rented by this user are:'
   puts user.history
  end
end