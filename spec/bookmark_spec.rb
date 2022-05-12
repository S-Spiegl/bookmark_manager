require 'bookmark'
require 'pg'

describe Bookmark do
  describe '#all' do
    it 'returns a list of bookmarks' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.orangepippintrees.co.uk');")
      # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.test.com');")
      #refactored the commented-out above and replaced with below
      Bookmark.add("http://www.makersacademy.com")
      Bookmark.add("http://www.orangepippintrees.co.uk")
      Bookmark.add("http://www.test.com")
      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://www.orangepippintrees.co.uk")
      expect(bookmarks).to include("http://www.test.com")
    end
  end

  describe '#add' do
    it 'adds a bookmark' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      url = 'www.makers.com'
      Bookmark.add(url)
      expect(Bookmark.all).to include(url)
    end
  end
end

# Test drive a refactor of the code to use a Model, that returns the list of bookmarks.
# You'll probably want to create a Bookmark model that responds to the class method .all with a hard-coded array of Bookmark instances.
