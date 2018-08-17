
class Books
## attr_accessor :book_name, :book_author, :book_cost, :book_rating
  def initialize(book_name=nil, book_author=nil, book_cost=nil, book_rating=nil)
    @book_name = book_name
    @book_author = book_author
    @book_cost = book_cost
    @book_rating = book_rating
  end

  def make_operation(operation, book_name=nil, book_author=nil, book_cost=nil, book_rating=nil)

    books = {
    TestBook1: ["Artur Simonov", 500, 10],
    TestBook2: ["Linse Lohan", 240, 4] }
    case operation
      when "delete"
        puts "Which book you prefer to delete?"
        book_name = gets.chomp
        books.each do |book_name, book_info|
          if books.include?(book_name)
            books.delete(book_name)
            puts "Deleted!"
          else
            puts "No book with this name"
        end
        end
      when "add"
        puts "Hi! Now you are adding new book. Folow the instruction below."
        puts "First is Book name:" ; book_name = gets.chomp
        puts "Now add Author:" ; book_author = gets.chomp
        puts "Book cost..." ; book_cost = gets.chomp
        puts "And book rating!" ; book_rating = gets.chomp
        if book_rating > 10 ; puts "Dude! Only from 0 to 10 alowed"
        else
          books[book_name] = [book_author, book_cost, book_rating]
          Books.new.make_operation("show_all")
        end
      when "edit"
      when "show_all"
          books.each do |book_name, book_info|
          puts "#{book_name}, Author: #{book_info[0]}, Cost: #{book_info[1]}$, Rating: #{book_info[2]}/10"
        end
      when "show_best"
        books.each do |book_name, book_info|
          if book_info[2] >= 7
            puts "#{book_name}, Author: #{book_info[0]}, Cost: #{book_info[1]}$, Rating: #{book_info[2]}/10"
            end
          end
      when "show_worst"
        books.each do |book_name, book_info|
          if book_info[2] <= 4
            puts "#{book_name}, Author: #{book_info[0]}, Cost: #{book_info[1]}$, Rating: #{book_info[2]}/10"
            end
          end
      when "sort"
        puts "Your can sort by: author and cost. Which you choose? "
        choose = gets.chomp
        if choose == "author"
          author = gets.chomp
          books.each do |book_name, book_info|
            if book_info[0] == author
              puts "#{book_name}, Author: #{book_info[0]}, Cost: #{book_info[1]}$, Rating: #{book_info[2]}/10"
            end
          end
        elsif choose == "cost"
          puts "I will show you only cost From: "
          cost_from = gets.chomp
          print "To:"
          cost_to = gets.chomp
          books.each do |book_name, book_info|
            if (book_info[1] >= cost_from.to_i)&&(book_info[1] <= cost_to.to_i)
              puts "#{book_name}, Author: #{book_info[0]}, Cost: #{book_info[1]}$, Rating: #{book_info[2]}/10"
            end
          end
        else
          puts "Try maybe something else!"
    end
  end
end
end
puts "Hi! Your are in my BookStore app. Here your can do:  add, delete, sort, edit, show_(all/best/worst)"
operation = gets.chomp
test_me = Books.new
test_me.make_operation(operation)
