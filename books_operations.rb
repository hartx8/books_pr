require "yaml"
require "./books_store.rb"
require "./operations_modules.rb"
class BooksOperations
  include Operations
  attr_reader :books, :store
  def initialize
    @store = BooksStore.new
    @books = @store.books_storage
  end

  def make_operation(operation)
    case operation
    when "delete"
      puts "Which book you prefer to delete?"
      book_name = gets.chomp
      store.delete_book(book_name)
    when "add"
      add
    when "edit"
      edit_book
    when "show_all"
      show_all
    when "show_best"
      show_best
    when "show_worst"
      show_worst
    when "sort"
      sort
    end
  end
end
puts "Hi! Your are in my BookStore app. Here your can do:  add, delete, sort, edit, show_(all/best/worst)"
operation = gets.chomp
BooksOperations.new.make_operation(operation)
