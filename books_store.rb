require "yaml"
class BooksStore

  attr_reader :storage
  def initialize
    @storage = YAML.load_file("./storage.yml")
  end

  def add_new(book_name, book_info)
    storage[book_name]= book_info
    write_to_file
  end

  def delete_book(book_name)
    if storage[book_name] != nil
      storage.delete(book_name)
      write_to_file
    else
      puts "Book does not exist"
    end
  end

  def write_to_file
    File.open("./storage.yml", "w") {|file| file.write(storage.to_yaml)}
  end

   def books_storage
     storage
  end
end
