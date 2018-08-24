require "yaml"
class BooksStore
  def initialize(book_name= nil, book_info= nil)
    @book_name = book_name
    @book_info = book_info
  end

  def add_new(book_name, book_info)
    storage = YAML.load_file("./storage.yml")
    storage[book_name]= book_info
    File.open("./storage.yml", "w") {|file| file.write(storage.to_yaml)}
  end

  def delete_book(book_name)
    storage = YAML.load_file("./storage.yml")
    if  storage[book_name] != nil
      storage.delete(book_name)
      File.open("./storage.yml", "w") {|file| file.write(storage.to_yaml)}
    else
      puts "Book does not exist"
    end
  end

   def books_storage
     YAML.load_file("./storage.yml")
  end
end

#Books.new.add_new("")
