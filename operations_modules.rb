module Operations
  def edit_book # NOT READY
    puts "Which book you need to edit?"
    book_name = gets.chomp
    if books[book_name] != nil
      book_info = books[book_name]
      print_out(book_name, book_info)
      puts "What your want to change: author, cost, rating or name?"
      choise = gets.chomp
      edit_choose(choise, book_name)
    else
      puts "Book does not exist"
    end
  end

  def edit_choose(choise, book_name)
  book_info = books[book_name]
    case choise
      when "author"
        puts "New Author: " ; book_author = gets.chomp
        book_info[:author] = book_author
        edit_make_changes(book_name, book_info)
      when "cost"
        puts "New Cost: " ; book_cost = gets.chomp
        book_info[:cost] = book_cost.to_i
        edit_make_changes(book_name, book_info)
      when "rating"
        puts "New Rating: !" ; book_rating = gets.chomp
        book_info[:rating] = book_rating.to_i
        edit_make_changes(book_name, book_info)
      when "name"
        puts "New Book Name: " ; book_name_new = gets.chomp
        store.delete_book(book_name)
        edit_make_changes(book_name_new, book_info)
      end
  end

  def edit_make_changes(book_name, book_info)
    store.add_new(book_name, book_info)
  end



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

  def sort
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

  def sort_by_author
    puts "Author name:"
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
