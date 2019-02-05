require './store'
all = Store.new

continue = true

while continue
  puts """
  1. Category
  2. Movie
  3. User
  SELECT ONE OPTION
  """
  option =gets.chomp.to_i
  case option
    when 1
      puts """
      1. Add 
      2. List
      3.Delete
      4.Edit
      SELECT ONE OPTION
      """
      option = gets.chomp.to_i
      if option == 1
        puts 'Insert name of categoy:'
        name = gets.chop
        all.add_category(name)
      elsif option == 2
        all.list_category
      elsif option == 3
        all.list_category
        puts 'What category do you want to delete?'
        index = gets.chomp.to_i
        all.delete_category(index)
      elsif option == 4
        all.list_category
        puts 'What category do you want to edit?'
        index = gets.chomp.to_i
        puts 'Insert new name:'
        name = gets.chomp
        all.edit_category(index, name)
      else
        puts "Incorrect option"
      end
    when 2
      puts """
      1. Add 
      2. List
      3.Delete
      4.Edit
      5.Assign categories
      6. Rented
      7. Return movie
      SELECT ONE OPTION
      """
      option = gets.chomp.to_i
      if option == 1
        puts 'Insert name of the movie:'
        name = gets.chop
        puts 'Insert the quantity of stock:'
        quant = gets.chomp.to_i
        all.add_movie(name, quant)
        puts 'OK'
      elsif option == 2
        all.list_movie
      elsif option == 3
        all.list_movie
        puts 'What movie do you want to eliminate?'
        index = gets.chomp.to_i
        all.delete_movie(index)
      elsif option == 4
        all.list_movie
        puts 'select to movie'
        index = gets.chomp.to_i
        puts 'Insert new name'
        name = gets.chomp
        puts 'Insert new quantity'
        quant = gets.chomp.to_i
        all.edit_movie(index, name, quant)
      elsif option == 5
        all.list_category
        puts 'select categories:'
        index = gets.chomp.to_i
        movie.add_category_at_movie (index)
      else
        puts 'Error: incorrect option'
      end
    when  3  
      puts """
      1. Add 
      2. List
      3.Delete
      4.Edit
      SELECT ONE OPTION
      """
      option = gets.chomp.to_i
      if option == 1
        puts  'Add user'
        puts 'Name: '
        name = gets.chomp
        puts 'Identification: '
        id = gets.chomp.to_i
        all.add_user(name, id)
        puts 'All ready'
      elsif option == 2
        all.list_user
      elsif option == 3
        all.list_user
        puts 'Select the user you want to delete:'
        index = gets.chomp.to_i
        all.delete_user(index)
      elsif option == 4
        all.list_user
        puts 'Select the user you want to edit:'
        index = gets.chomp.to_i
        puts 'New name:'
        name = gets.chomp 
        puts 'New identification:'
        id = gets.chomp.to_i
        all.edit_user(name, id, index)
      else
        puts 'Incorrect option'
      end

    else
    puts 'Error'

  end
end