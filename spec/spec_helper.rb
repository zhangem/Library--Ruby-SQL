require 'rspec'
require 'pg'
require 'authors'
require 'books'
require 'checkouts'
require 'copies'
require 'patrons'

DB = PG.connect(:dbname => 'library_system_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM patrons *;")
    DB.exec("DELETE FROM copies *;")
    DB.exec("DELETE FROM checkouts *;")
  end
end
