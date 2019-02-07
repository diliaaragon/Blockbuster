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
    @categories.each do |category|
      unless category.name == name
        p = Categories.new(name)
        @categories << p
      else
       puts'Existing category'
      end
    end
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
    @movies.each do |movie|
      unless movie.name == name
        p = Movie.new(name, quant)
        @movies << p
      else
        puts 'Existing movie'
      end
    end
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
    @users.each do |user|
      unless user.id == id
        p = User.new(name, id)
        @users << p
      else
        puts'Existing user'
      end
    end
  end

  def list_user
    @users.each_with_index do |user, index|
      name = user.name
      id = user.id
      movies = user.movies
      num = 0
      movies.each_with_index do |movie, index|
        num = index + 1
      end
      puts "#{index}. #{name} - id: #{id} rented movies: #{num}"
    end
  end

  def movies_by_categories(category)
    @movies.each do |movie|
      categories = movie.categories
      categories.each do |category|
        if category.name == category
          puts movie.name
        end
      end
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
    cont = 0
    user.movies.each do |movie|
      if movie != nil
        cont += 1
      end 
    end 

    if movie.rented <= movie.quantity && cont < 3
      user.movies << movie
      user.history << movie.name
      @movies[index_movie].rented += 1
      @movies[index_movie].history << "The user #{user.name} rented this movie - date of return: #{date}"
    else
     puts 'This movie is not available or the user has too many rented movies'
    end
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