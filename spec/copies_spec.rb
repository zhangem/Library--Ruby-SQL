require 'spec_helper'

describe Copies do
  describe 'initialize' do
    it 'initalizes an instance of copies' do
      test_copies = Copies.new({'book_id' => 3, 'authors_id' => 4})
      test_copies.should be_an_instance_of Copies
    end
  end

  describe 'all' do
    it 'starts off as an empty array' do
      Copies.all.should eq []
    end
  end

  describe '==' do
    it 'recognizes a matching catalog entry' do
      test_copies1 = Copies.new({'book_id' => 5, 'authors_id' => 2})
      test_copies2 = Copies.new({'book_id' => 5, 'authors_id' => 2})
      test_copies1.should eq test_copies2
    end
  end

  describe 'save' do
    it 'saves the inputs of the catalog to the database' do
      test_copies = Copies.new({'book_id' => 5, 'authors_id' => 10})
      test_copies.save
      Copies.all
    end
  end
end
