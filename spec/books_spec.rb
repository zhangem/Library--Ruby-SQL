require 'spec_helper'

describe Books do
  describe 'initialize' do
    it 'initalizes an instance of Books' do
      test_books = Books.new({'name' => 'Fear and Loathing in Las Vegas'})
      test_books.should be_an_instance_of Books
    end
    it 'should return a name of a book' do
      test_books = Books.new({'name' => 'Confederacy of Dunces'})
      test_books.name.should eq 'Confederacy of Dunces'
    end
  end

  describe 'all' do
    it 'starts off as an empty array' do
      Books.all.should eq []
    end
  end

  describe '==' do
    it 'recognizes a matching book name' do
      test_books1 = Books.new({'name' => 'Frankenstein'})
      test_books2 = Books.new({'name' => 'Frankenstein'})
      test_books1.should eq test_books2
    end
  end

  describe 'save' do
    it 'saves the name of the book to the database' do
      test_books = Books.new({'name' => 'Dracula'})
      test_books.save
      Books.all
    end
  end

  describe 'delete' do
    it 'deletes the name of a book from the database' do
      test_books = Books.new({'name' => 'The Kite Runner'})
      test_books.save
      test_books.delete
      Books.all.should eq []
    end
  end
end

  # describe 'update' do
  #   it 'changes the incorrect book title to the correct one' do
  #     test_books = Books.new({'name' => 'Catch-32'})
  #     test_books.save
  #     Books.all.update({'name' => 'Catch-22'})
  #     test_books.save
  #     test_books.should.eq 'Catch-22'
  #   end
  # end
















