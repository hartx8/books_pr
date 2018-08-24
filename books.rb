require "yaml"
require "./books_store.rb"
require "./operations_modules.rb"
class BooksStore
  include Operations
  attr_reader :books
  def initialize
    @books = Books.new.books_storage
  end

  def make_operation(operation)
    case operation
    when "delete"
      puts "Which book you prefer to delete?"
      book_name = gets.chomp
      delete_book(book_name)
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
      puts "Your can sort by: author and cost. Which you choose? "
      choose = gets.chomp
      if choose == "author"
        sort_by_author
      elsif choose == "cost"
        sort_by_cost
      else
        puts "Try maybe something else!"
      end
    end
  end
end
puts "Hi! Your are in my BookStore app. Here your can do:  add, delete, sort, edit, show_(all/best/worst)"
operation = gets.chomp
BooksStore.new.make_operation(operation)
