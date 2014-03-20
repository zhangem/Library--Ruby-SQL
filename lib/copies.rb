class Copies

  attr_reader :id, :book_id, :authors_id

  def initialize(attributes)
    @id = attributes['id']
    @book_id = attributes['book_id']
    @authors_id = attributes['authors_id']
  end

  def self.all
    copies_list = []
    results = DB.exec("SELECT * FROM copies;")
    results.each do |x|
      copies_list << Copies.new(x)
    end
    copies_list
  end

   def ==(another)
    self.book_id == another.book_id && self.authors_id == another.authors_id
  end

  def save
    results = DB.exec("INSERT INTO copies (book_id, authors_id) VALUES ('#{@book_id}', '#{@authors_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end
end
