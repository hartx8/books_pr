require "yaml"
class BooksStore

  attr_reader :storage
  def initialize
    @storage = YAML.load_file("./storage.yml")
  end

  def add_new(book_name, book_info)
    storage[book_name]= book_info
    File.open("./storage.yml", "w") {|file| file.write(storage.to_yaml)}
  end

  def delete_book(book_name)
    if  storage[book_name] != nil
      storage.delete(book_name)
      File.open("./storage.yml", "w") {|file| file.write(storage.to_yaml)}
    else
      puts "Book does not exist"
    end
  end

   def books_storage
     storage
  end
end

#Books.new.add_new("")
