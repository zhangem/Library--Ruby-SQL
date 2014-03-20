class Authors

  attr_reader :id, :name

  def initialize(attributes)
    @id = attributes['id']
    @name = attributes['name']
  end

  def self.all
    authors_list = []
    results = DB.exec("SELECT * FROM authors;")
    results.each do |x|
      authors_list << Authors.new(x)
    end
    authors_list
  end

   def ==(another)
    self.name == another.name
  end

  def save
    results = DB.exec("INSERT INTO authors (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def delete
    results = DB.exec("DELETE FROM authors WHERE name = '#{self.name}';")
  end
end
