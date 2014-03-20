require 'spec_helper'

describe Authors do
  describe 'initialize' do
    it 'initalizes an instance of Authors' do
      test_authors = Authors.new({'name' => 'Hunter Thompson'})
      test_authors.should be_an_instance_of Authors
    end
    it 'should return a name of an author' do
      test_authors = Authors.new({'name' => 'Dr. Seuss'})
      test_authors.name.should eq 'Dr. Seuss'
    end
  end

  describe 'all' do
    it 'starts off as an empty array' do
      Authors.all.should eq []
    end
  end

  describe '==' do
    it 'recognizes a matching author name' do
      test_authors1 = Authors.new({'name' => 'Harry Potter'})
      test_authors2 = Authors.new({'name' => 'Harry Potter'})
      test_authors1.should eq test_authors2
    end
  end

  describe 'save' do
    it 'saves the name of the author to the database' do
      test_authors = Authors.new({'name' => 'Stephen Thompson'})
      test_authors.save
      Authors.all
    end
  end

  describe 'delete' do
    it 'deletes the name of an from the database' do
      test_authors = Authors.new({'name' => 'J.K. Rowling'})
      test_authors.save
      test_authors.delete
      Authors.all.should eq []
    end
  end
end
