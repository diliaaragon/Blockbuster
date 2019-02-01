require './store'

all = Store.new

continue = true

while continue
  puts """
  1. Category
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
      else 
        puts "Incorrect option" 
      end
    else
  end
end 