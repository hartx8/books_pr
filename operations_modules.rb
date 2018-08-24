module Operations
  def edit_book # NOT READY
    puts "Which book you need to edit?"
    book_name_to_edit = gets.chomp
    books.each do |book_name, book_info|
      if book_name == book_name_to_edit
        puts "If you good with param that your see, just skip(enter)"
        puts "Book title #{book_name}, new: "
        new_book_name = gets.chomp
        puts "Book Author is #{book_info[:author]}, new: "
        new_book_author = gets.chomp
        puts "Book cost is #{book_info[:cost]}, new: "
        new_book_cost = gets.chomp
        puts "Book rating is #{book_info[:rating]}, new: "
        new_book_rating = gets.chomp
        if !new_book_author.nil?
          book_info[:author] = new_book_author
          if !new_book_cost.nil?
            book_info[:cost] = new_book_cost.to_i
            if !new_book_rating.nil?
              book_info[:rating] = new_book_rating.to_i
            end
          end
        end
        store.add_new(book_name, book_info)
      end
    end
  end

# Loh2

  def add
    puts "Hi! Now you are adding new book. Folow the instruction below."
    puts "First is Book name:" ; book_name = gets.chomp
    puts "Now add Author:" ; book_author = gets.chomp
    puts "Book cost..." ; book_cost = gets.chomp
    puts "And book rating!" ; book_rating = gets.chomp
    if book_rating.to_i > 10
      puts "Dude! Only from 0 to 10 alowed"
    else
      book_info = Hash.new
      book_name.to_sym
      book_info[:author] = book_author
      book_info[:cost] = book_cost.to_i
      book_info[:rating] = book_rating.to_i
      store.add_new(book_name, book_info)
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

  def print_out(book_name, book_info)
    puts "Title: #{book_name}, Author: #{book_info[:author]}, Cost: #{book_info[:cost]}$, Rating: #{book_info[:rating]}/10"
  end
end
