require 'pg'
require './lib/authors'
require './lib/books'

DB = PG.connect(:dbname => 'library_system_test')

def main_menu
  puts "---  Welcome to the Multnomah County Public Library ---"
  puts "Select 'B' to add a book."
  puts "Select 'd' to delete a book."
  puts "Select 'v' to view all books."
  # puts "Select 'u' to update a book."
  puts "Select 'x' to exit system."
  main_selection = gets.chomp.downcase
  case main_selection
  when 'b'
    add_book
  when 'd'
    delete_book
  when 'v'
    view_books
  # when 'u'
  #   update_book
  when 'x'
    puts "Good-Bye!"
    exit
  else
    main_menu
  end
end

def add_book
  puts "Enter the title of the book:"
  new_book = gets.chomp
  new_book = Books.new({'name' => new_book})
  new_book.save
  puts "The book '#{new_book.name}' has been added."
  main_menu
end

def delete_book
  puts "Enter the book you wish to delete:"
  book_to_delete = gets.chomp
  book_to_delete = Books.new({'name' => book_to_delete})
  book_to_delete.save
  book_to_delete.delete
  puts "The book '#{book_to_delete.name}' has been deleted."
  main_menu
end

def view_books
  puts "Here is a list of all the books:"
  Books.all.each do |x,index|
    puts "#{index + 1}. #{x.name}"
  end
  puts "Press 'm' to return to the main menu or 'x' to exit."
  user_choice = gets.chomp
  if user_choice == 'x'
    exit
  else
    main_menu
  end
end

# def update_book
#   puts "Enter the book you wish to update:"
#   book_to_update = gets.chomp
#   puts "Enter new book name:"
#   name_update = gets.chomp
#   book = Books.new(book_to_update)
#   Books.update(books.id, name_update)
#   #book.update(name_update)
#   puts "The book '#{book.name}' has been updated."
#   main_menu
# end



main_menu

