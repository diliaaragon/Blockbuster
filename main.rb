require './store'
store = Store.new

continue = true

while continue
  puts """
  _______________________________
  |    WELCOME TO BLOCKBUSTER   |
  |_____________________________|
  | 1. Category                 |
  | 2. Movie                    |
  | 3. User                     |
  |     SELECT ONE OPTION       |
  |_____________________________|
  """
  option =gets.chomp.to_i
  case option
    when 1
      puts """
      ____________________
      | 1. Add           |
      | 2. List          |
      | 3.Delete         |
      | 4.Edit           |
      |SELECT ONE OPTION |
      """
      option = gets.chomp.to_i
      if option == 1
        puts 'Insert name of categoy:'
        name = gets.chop
        store.add_category(name)
      elsif option == 2
        store.list_category
      elsif option == 3
        store.list_category
        puts 'What category do you want to delete?'
        index = gets.chomp.to_i
        store.delete_category(index)
      elsif option == 4
        store.list_category
        puts 'What category do you want to edit?'
        index = gets.chomp.to_i
        puts 'Insert new name:'
        name = gets.chomp
        store.edit_category(index, name)
      else
        puts "Incorrect option"
      end
    when 2
      puts """
      _______________________
      | 1. Add              |
      | 2. List             |
      | 3. Delete           |
      | 4. Edit             |
      | 5. Assign categories|
      | 6. Rented           |
      | 7. Return movie     |
      | 8. Show hitorial    |
      | SELECT ONE OPTION   |
      """
      option = gets.chomp.to_i
      if option == 1
        puts 'Insert name of the movie:'
        name = gets.chop
        puts 'Insert the quantity of stock:'
        quant = gets.chomp.to_i
        store.add_movie(name, quant)
        puts 'OK'
      elsif option == 2
        store.list_movie
      elsif option == 3
        store.list_movie
        puts 'What movie do you want to eliminate?'
        index = gets.chomp.to_i
        store.delete_movie(index)
      elsif option == 4
        store.list_movie
        puts 'Select to movie'
        index = gets.chomp.to_i
        puts 'Insert new name'
        name = gets.chomp
        puts 'Insert new quantity'
        quant = gets.chomp.to_i
        store.edit_movie(index, name, quant)
      elsif option == 5
        puts 'Select the movie'
        store. list_movie
        index_movie = gets.chomp.to_i
        puts 'Select categories:'
        store.list_category
        index_category = gets.chomp.to_i
        store.assign_categories(index_movie, index_category)
        puts 'store ready'
      elsif option == 6
        puts 'Select a user:'
        store.list_user
        index_user = gets.chomp.to_i
        puts 'Select the movie'
        store.list_movie
        index_movie = gets.chomp.to_i
        puts 'Date of return DD/MM/AAAA'
        date = gets.chomp
        store.rented_movie(index_user, index_movie, date)
      elsif option == 7
        puts 'What movie do you want to return?'
        store.list_movie
        index = gets.chomp.to_i
        store.return_movie(index)
      elsif option == 8
        puts 'What movie do you want to see the history of?'
        store.list_movie
        index = gets.chomp.to_i
        store.look_history(index)
      else
        puts 'Error: incorrect option'
      end
    when  3
      puts """
      _______________________________
      | 1. Add                      |
      | 2. List                     |
      | 3. Delete                   |
      | 4. Edit                     |
      | 5. List of the rented movies|
      |     SELECT ONE OPTION       |
      """
      option = gets.chomp.to_i
      if option == 1
        puts  'Add user'
        puts 'Name:'
        name = gets.chomp
        puts 'Identification:'
        id = gets.chomp.to_i
        store.add_user(name, id)
        puts 'store ready'
      elsif option == 2
        store.list_user
      elsif option == 3
        store.list_user
        puts 'Select the user you want to delete:'
        index = gets.chomp.to_i
        store.delete_user(index)
      elsif option == 4
        store.list_user
        puts 'Select the user you want to edit:'
        index = gets.chomp.to_i
        puts 'New name:'
        name = gets.chomp
        puts 'New identification:'
        id = gets.chomp.to_i
        store.edit_user(name, id, index)
      elsif option == 4
        puts 'Select a user'
        store.list_user
        index = gets.chomp.to_i
        list_rented_movies(index)
      else
        puts 'Incorrect option'
      end
    else
    puts 'Error: INCORRECT OPTION'
  end
  puts 'Want to continue?y/n'
  answer = gets.chomp
  answer.downcase
  continue = false if answer == 'n'
end