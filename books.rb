
class BooksStore
  attr_reader :books
  def initialize
    @books = {
      TestBook1: { author: "Artur Simonov",
                   cost: 500,
                   rating: 10 },
      TestBook2: { author: "Linse Lohan",
                   cost: 499,
                   rating: 3 }
    }
  end

  def make_operation(operation)
    case operation
    when "delete"
      puts "Which book you prefer to delete?"
      book_name = gets.chomp
      delete(book_name)
    when "add"
      add
      show_all
    when "edit"
      # TODO: Create edit method
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

  private

  def add
    puts "Hi! Now you are adding new book. Folow the instruction below."
    puts "First is Book name:" ; book_name = gets.chomp
    puts "Now add Author:" ; book_author = gets.chomp
    puts "Book cost..." ; book_cost = gets.chomp
    puts "And book rating!" ; book_rating = gets.chomp
    if book_rating > 10
      puts "Dude! Only from 0 to 10 alowed"
    else
      books[book_name] = [book_author, book_cost, book_rating]
    end
  end

  def sort_by_author
    author = gets.chomp
    books.each do |book_name, book_info|
      if book_info[:author] == author
        print_out(book_name, book_info)
      end
    end
  end

  def sort_by_cost
    puts "I will show you only cost From: "
    cost_from = gets.chomp
    print "To:"
    cost_to = gets.chomp
    books.each do |book_name, book_info|
      if (book_info[:cost] >= cost_from.to_i)&&(book_info[:cost] <= cost_to.to_i)
        print_out(book_name, book_info)
      end
    end
  end

  def show_all
    books.each do |book_name, book_info|
      print_out(book_name, book_info)
    end
  end

  def show_best
    books.each do |book_name, book_info|
      if book_info[:rating] >= 7
        print_out(book_name, book_info)
      end
    end
  end

  def show_worst
    books.each do |book_name, book_info|
      if book_info[:rating] <= 4
        print_out(book_name, book_info)
      end
    end
  end

  def delete(book_name)
    books.each do |book_name, book_info|
      if books.include?(book_name)
        books.delete(book_name)
        puts "Deleted!"
      else
        puts "No book with this name"
      end
    end
  end

  def print_out(book_name, book_info)
    puts "#{book_name}, Author: #{book_info[:author]}, Cost: #{book_info[:cost]}$, Rating: #{book_info[:rating]}/10"
  end
end

puts "Hi! Your are in my BookStore app. Here your can do:  add, delete, sort, edit, show_(all/best/worst)"
operation = gets.chomp
BooksStore.new.make_operation(operation)
