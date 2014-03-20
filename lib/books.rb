class Books

  attr_reader :id, :name

  def initialize(attributes)
    @id = attributes['id']
    @name = attributes['name']
  end

  def self.all
    books_list = []
    results = DB.exec("SELECT * FROM books;")
    results.each do |x|
      books_list << Books.new(x)
    end
    books_list
  end

   def ==(another)
    self.name == another.name
  end

  def save
    results = DB.exec("INSERT INTO books (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    DB.exec("DELETE FROM books WHERE name = '#{self.name}';")
  end
end

  # def self.update(book_id, new_name)
  #   DB.exec("UPDATE books SET name = '#{new_name}' WHERE id = '#{book_id}';")
  # end

